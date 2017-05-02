from django.conf import settings
from django.core import mail
from django.core.urlresolvers import reverse
from django.views.generic.base import View
from django.views.generic import ListView
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from .models import Response


class IndexView(View):
    template_name = "main/index.html"

    def get(self, request):
        return render(request, self.template_name, dict())

    def post(self, request):
        rs = {'r' + str(i): request.POST.get('r' + str(i), '')
              for i in range(1, 17)}

        qs = {'q' + str(i): request.POST.get('q' + str(i), '')
              for i in range(1, 25)}
        qs.update(rs)
        for question in ['sex', 'race', 'amputation_level', 'amputation_cause',
                         'age']:
            qs[question] = request.POST.get(question, '')
        r = Response.objects.create(**qs)
        return HttpResponseRedirect(reverse("score", args=[r.id, ]))


class ResultsView(ListView):
    model = Response


class EmailView(View):
    def post(self, request):
        address = request.POST.get('email', None)
        r = get_object_or_404(Response, pk=request.POST.get('response', ''))
        mail.send_mail(
            'Your PUMP results',
            r.email_text(),
            settings.SERVER_EMAIL,
            [address],
        )
        return HttpResponse(
            "your results have been sent to {address}".format(address=address))
