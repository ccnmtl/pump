from django.core.urlresolvers import reverse
from django.views.generic.base import View
from django.views.generic import ListView
from django.shortcuts import render
from django.http import HttpResponseRedirect
from .models import Response


class IndexView(View):
    template_name = "main/index.html"

    def get(self, request):
        return render(request, self.template_name, dict())

    def post(self, request):
        qs = {'q' + str(i): request.POST.get('q' + str(i), '')
              for i in range(1, 25)}
        r = Response.objects.create(**qs)
        return HttpResponseRedirect(reverse("score", args=[r.id, ]))


class ResultsView(ListView):
    model = Response
