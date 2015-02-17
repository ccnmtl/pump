from django.views.generic.base import View
from django.shortcuts import render
from django.http import HttpResponse
from .models import Response


class IndexView(View):
    template_name = "main/index.html"

    def get(self, request):
        return render(request, self.template_name, dict())

    def post(self, request):
        qs = {'q' + str(i): request.POST.get('q' + str(i), '')
              for i in range(1, 25)}
        Response.objects.create(**qs)
        return HttpResponse("thanks for participating")
