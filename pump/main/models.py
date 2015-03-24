from django.db import models
from django.template import Context
from django.template.loader import get_template
from .criteria import Houghton, ABC, PassFail


class Response(models.Model):
    added = models.DateTimeField(auto_now_add=True)
    # Houghton
    q1 = models.TextField(blank=True, default="")
    q2 = models.TextField(blank=True, default="")
    q3 = models.TextField(blank=True, default="")
    q4 = models.TextField(blank=True, default="")
    q5 = models.TextField(blank=True, default="")
    q6 = models.TextField(blank=True, default="")
    # ABC
    q7 = models.TextField(blank=True, default="")
    q8 = models.TextField(blank=True, default="")
    q9 = models.TextField(blank=True, default="")
    q10 = models.TextField(blank=True, default="")
    q11 = models.TextField(blank=True, default="")
    q12 = models.TextField(blank=True, default="")
    q13 = models.TextField(blank=True, default="")
    q14 = models.TextField(blank=True, default="")
    q15 = models.TextField(blank=True, default="")
    q16 = models.TextField(blank=True, default="")
    q17 = models.TextField(blank=True, default="")
    q18 = models.TextField(blank=True, default="")
    q19 = models.TextField(blank=True, default="")
    q20 = models.TextField(blank=True, default="")
    q21 = models.TextField(blank=True, default="")
    q22 = models.TextField(blank=True, default="")
    # pick up
    q23 = models.TextField(blank=True, default="")
    # look behind
    q24 = models.TextField(blank=True, default="")

    def __unicode__(self):
        return "Response %s" % self.added

    def results(self):
        s = Scorer(self)
        return s.results()

    def email_text(self):
        """ body of email version """
        t = get_template("main/response_email.txt")
        c = Context(dict(response=self))
        return t.render(c)


class Scorer(object):
    def __init__(self, r):
        h_values = [r.q1, r.q2, r.q3, r.q4, r.q5, r.q6]
        h_values = [int(v) for v in h_values if v != ""]
        self.h = Houghton(h_values)
        a_values = [
            r.q7, r.q8, r.q9, r.q10, r.q11, r.q12,
            r.q13, r.q14, r.q15, r.q16, r.q17, r.q18,
            r.q19, r.q20, r.q21, r.q22,
        ]
        a_values = [int(v) for v in a_values if v != ""]
        self.abc = ABC(a_values)
        self.pick_up = PassFail(int(r.q23 or '1'))
        self.look_behind = PassFail(int(r.q24 or '1'))

    def number_passed(self):
        return (
            self.h.pass_fail() +
            self.abc.pass_fail() +
            self.pick_up.pass_fail() +
            self.look_behind.pass_fail())

    def percentage_likelihood(self):
        percents = ['95.6', '93.9', '92.1', '81.4', '59.3']
        return percents[self.number_passed()]

    def results(self):
        return dict(
            houghton=self.h,
            abc=self.abc,
            pick_up=self.pick_up,
            look_behind=self.look_behind,
            number_passed=self.number_passed(),
            percentage_likelihood=self.percentage_likelihood(),
        )
