import factory
from pump.main.models import Response


class ResponseFactory(factory.DjangoModelFactory):
    class Meta:
        model = Response
