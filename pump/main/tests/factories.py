from factory.django import DjangoModelFactory
from pump.main.models import Response


class ResponseFactory(DjangoModelFactory):
    class Meta:
        model = Response
