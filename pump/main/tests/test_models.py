from django.test import TestCase
from .factories import ResponseFactory


class ResponseTest(TestCase):
    def test_unicode(self):
        r = ResponseFactory()
        self.assertTrue(str(r).startswith('Response'))
