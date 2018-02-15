from django.db import models
from django.template.loader import get_template
from .criteria import Houghton, ABC, PassFail


class Response(models.Model):
    added = models.DateTimeField(auto_now_add=True)

    # Survey Info
    sex = models.TextField(blank=True, default="")
    race = models.TextField(blank=True, default="")
    amputation_level = models.TextField(blank=True, default="")
    amputation_cause = models.TextField(blank=True, default="")
    age = models.TextField(blank=True, default="")

    # Risk Inventory Questions
    r1 = models.TextField(blank=True, default="")
    r2 = models.TextField(blank=True, default="")
    r3 = models.TextField(blank=True, default="")
    r4 = models.TextField(blank=True, default="")
    r5 = models.TextField(blank=True, default="")
    r6 = models.TextField(blank=True, default="")
    r7 = models.TextField(blank=True, default="")
    r8 = models.TextField(blank=True, default="")
    r9 = models.TextField(blank=True, default="")
    r10 = models.TextField(blank=True, default="")
    r11 = models.TextField(blank=True, default="")
    r12 = models.TextField(blank=True, default="")
    r13 = models.TextField(blank=True, default="")
    r14 = models.TextField(blank=True, default="")
    r15 = models.TextField(blank=True, default="")
    r16 = models.TextField(blank=True, default="")

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
        c = dict(object=self)
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

        self.sex = r.sex
        self.race = r.race
        self.amputation_level = r.amputation_level
        self.amputation_cause = r.amputation_cause
        self.age = r.age

        self.r1 = r.r1 == "1" or r.r1 == "2+"
        self.r2 = r.r2 == "yes"
        self.r3 = r.r3 == "yes"
        self.r4 = r.r4 == "yes"
        self.r5 = r.r5 == "yes"
        self.r6 = r.r6 == "yes"
        self.r7 = r.r7 == "yes"
        self.r8 = r.r8 == "yes"
        self.r9 = r.r9 == "yes"
        self.r10 = r.r10 == "yes"
        self.r11 = r.r11 == "yes"
        self.r12 = r.r12 == "yes"
        self.r13 = r.r13 == "yes"
        self.r14 = r.r14 == "yes"
        self.r15 = r.r15 == "yes"
        self.r16 = r.r16 == "yes"

    def number_passed(self):
        return (
            self.h.pass_fail() +
            self.abc.pass_fail() +
            self.pick_up.pass_fail() +
            self.look_behind.pass_fail())

    def percentage_likelihood(self):
        percents = ['95.6', '93.9', '92.1', '81.4', '59.3']
        return percents[self.number_passed()]

    def percentage_positive(self):
        percents = ['4.4', '6.1', '7.9', '18.6', '40.7']
        return percents[self.number_passed()]

    # The criteria for this function are defined by documentation
    # from the client.
    def fall_related_injury(self):
        return (self.sex == "Female" or
                self.race != "White Caucasian" or
                self.amputation_level == "Transtibial" or
                self.amputation_cause == "Vascular Disease")

    def over_55(self):
        return (self.age == "55-64" or
                self.age == "65-74" or
                self.age == "75+")

    def results(self):
        return dict(
            houghton=self.h,
            abc=self.abc,
            pick_up=self.pick_up,
            look_behind=self.look_behind,
            number_passed=self.number_passed(),
            percentage_likelihood=self.percentage_likelihood(),
            percentage_positive=self.percentage_positive(),
            fall_related_injury=self.fall_related_injury(),
            over_55=self.over_55(),
            r1=self.r1,
            r2=self.r2,
            r3=self.r3,
            r4=self.r4,
            r5=self.r5,
            r6=self.r6,
            r7=self.r7,
            r8=self.r8,
            r9=self.r9,
            r10=self.r10,
            r11=self.r11,
            r12=self.r12,
            r13=self.r13,
            r14=self.r14,
            r15=self.r15,
            r16=self.r16,
        )
