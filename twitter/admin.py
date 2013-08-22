from django.contrib import admin
from models.application import Application
from models.user import User
from models.tweet import Tweet
from models.searchterm import SearchTerm

class ApplicationAdmin(admin.ModelAdmin):
  list_display = ('name', 'search_terms', 'tweets_count')
admin.site.register(Application, ApplicationAdmin)

class UserAdmin(admin.ModelAdmin):
  pass
admin.site.register(User, UserAdmin)

class TweetAdmin(admin.ModelAdmin):
  list_display = ('text', 'user', 'search_term', 'created_at')
  search_fields = ['id_str', 'text', 'user__name', 'search_term__term']  
admin.site.register(Tweet, TweetAdmin)

class SearchTermAdmin(admin.ModelAdmin):
  list_display = ('term', 'application', 'tweets_count')
admin.site.register(SearchTerm, SearchTermAdmin)