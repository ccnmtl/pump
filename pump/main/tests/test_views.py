from django.urls import reverse
from django.test import TestCase
from django.test.client import Client
from django.core import mail
from pump.main.models import Response
from django.contrib.messages import get_messages
from .factories import ResponseFactory


class BasicTest(TestCase):
    def setUp(self):
        self.c = Client()

    def test_root(self):
        response = self.c.get("/")
        self.assertEqual(response.status_code, 200)

    def test_smoketest(self):
        response = self.c.get("/smoketest/")
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "PASS")

    def test_empty_submit(self):
        # for now, it's ok to be empty
        self.c.post("/", dict())
        self.assertEqual(Response.objects.count(), 1)

    def test_results_empty(self):
        r = self.c.get(reverse('results'))
        self.assertEqual(r.status_code, 200)
        self.assertContains(r, "No responses")

    def test_results_notempty(self):
        ResponseFactory()
        r = self.c.get(reverse('results'))
        self.assertContains(r, "<table")

    def test_score_page(self):
        response = ResponseFactory()
        r = self.c.get(reverse('score', args=[response.id]))
        self.assertEqual(r.status_code, 200)

    def test_email_results(self):
        response = ResponseFactory()
        r = self.c.post(reverse('score-email'),
                        dict(email='foo@example.com',
                             response=response.id))
        self.assertEqual(r.status_code, 302)
        self.assertEqual(len(mail.outbox), 1)

    # Tests correct handling of no email submitted
    def test_email_none(self):
        response = ResponseFactory()
        r = self.c.post(reverse('score-email'),
                        dict(email='',
                             response=response.id))
        self.assertEqual(r.status_code, 302)
        messages = list(get_messages(r.wsgi_request))
        msg = messages[0].tags
        self.assertEqual(msg, 'error')
        self.assertEqual(len(mail.outbox), 0)

    # Tests correct handling of malformed email
    def test_email_malformed(self):
        """Tests correct handling of malformed email"""
        response = ResponseFactory()
        r = self.c.post(reverse('score-email'),
                        dict(email='foo@bar',
                             response=response.id))
        self.assertEqual(r.status_code, 302)
        messages = list(get_messages(r.wsgi_request))
        msg = messages[0].tags
        self.assertEqual(msg, 'error')
        self.assertEqual(len(mail.outbox), 0)
