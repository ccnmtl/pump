from django.db import models


class Response(models.Model):
    added = models.DateTimeField(auto_now_add=True)
    q1 = models.TextField(blank=True, default="")
    q2 = models.TextField(blank=True, default="")
    q3 = models.TextField(blank=True, default="")
    q4 = models.TextField(blank=True, default="")
    q5 = models.TextField(blank=True, default="")
    q6 = models.TextField(blank=True, default="")
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
    q23 = models.TextField(blank=True, default="")
    q24 = models.TextField(blank=True, default="")

    def __unicode__(self):
        return "Response %s" % self.added
