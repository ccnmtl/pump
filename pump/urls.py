import django.contrib.auth.views
import django.views.static
import djangowind.views

from django.contrib import admin
from django.conf import settings
from django.views.generic import TemplateView

from django.urls import include, path, re_path

from pump.main import views
import os.path
admin.autodiscover()

site_media_root = os.path.join(os.path.dirname(__file__), "../media")

redirect_after_logout = getattr(settings, 'LOGOUT_REDIRECT_URL', None)
auth_urls = re_path(r'^accounts/', include('django.contrib.auth.urls'))
logout_page = re_path(r'^accounts/logout/$',
                      django.contrib.auth.views.logout,
                      {'next_page': redirect_after_logout})
if hasattr(settings, 'CAS_BASE'):
    auth_urls = path('accounts/', include('djangowind.urls'))
    logout_page = re_path(r'^accounts/logout/$',
                          djangowind.views.logout,
                          {'next_page': redirect_after_logout})

urlpatterns = [
    auth_urls,
    logout_page,
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
    re_path(r'infranil/', include('infranil.urls')),
    re_path(r'^uploads/(?P<path>.*)$', django.views.static.serve,
            {'document_root': settings.MEDIA_ROOT}),
]

if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        re_path(r'^__debug__/', include(debug_toolbar.urls)),
    ]
