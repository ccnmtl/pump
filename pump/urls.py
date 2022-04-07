import os.path

from django.conf import settings
from django.conf.urls import url
from django.contrib import admin
import django.contrib.auth.views
from django.urls import include, path, re_path
from django.views.generic import TemplateView
import django.views.static
from django_cas_ng import views as cas_views
from pump.main import views


admin.autodiscover()

site_media_root = os.path.join(os.path.dirname(__file__), "../media")

urlpatterns = [
    url(r'^accounts/', include('django.contrib.auth.urls')),
    path('cas/login', cas_views.LoginView.as_view(),
         name='cas_ng_login'),
    path('cas/logout', cas_views.LogoutView.as_view(),
         name='cas_ng_logout'),
    re_path(r'^$', views.IndexView.as_view()),
    re_path(r'^results/$', views.ResultsView.as_view(), name='results'),
    re_path(r'^score/(?P<pk>\d+)/$', views.ScoreView.as_view(),
            name='score'),
    re_path(r'^score/$', views.ScoreView.as_view(),
            name='score-email'),
    path('admin/', admin.site.urls),
    re_path(r'^_impersonate/', include('impersonate.urls')),
    re_path(r'^stats/$', TemplateView.as_view(template_name="stats.html")),
    re_path(r'smoketest/', include('smoketest.urls')),
    re_path(r'^uploads/(?P<path>.*)$', django.views.static.serve,
            {'document_root': settings.MEDIA_ROOT}),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        re_path(r'^__debug__/', include(debug_toolbar.urls)),
    ]
