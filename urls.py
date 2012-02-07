from django.conf.urls.defaults import include, patterns
from django.contrib.sitemaps import FlatPageSitemap, GenericSitemap
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from blog.models import Post

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

from django.template.loader import add_to_builtins
add_to_builtins('insert_above.templatetags.insert_tags')


info_dict = {
    'queryset': Post.objects.published(),
    'date_field': 'pub_date',
}

sitemaps = {
    'flatpages': FlatPageSitemap,
    'blog': GenericSitemap(info_dict, priority=0.6),
}


urlpatterns = patterns('',
    (r'^', include('blog.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^images/', include('photologue.urls')),
    (r'^search/', include('haystack.urls')),
#    (r'^p/', include('work.urls')),
    (r'^s/', include('common.urls')),
#    (r'^comments/', include('threadedcomments.urls')),
    #(r'^comments/', include('django.contrib.comments.urls')),
    (r'^robots\.txt', 'robots.views.rules_list'),
    (r'^sitemap\.xml$', 'django.contrib.sitemaps.views.sitemap', {'sitemaps': sitemaps}),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
    )

urlpatterns += staticfiles_urlpatterns()
