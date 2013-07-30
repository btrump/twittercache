from django_cron import CronJobBase, Schedule
from twitter.models import Application

class ApplicationSearch(CronJobBase):
  RUN_EVERY_MINS = 0.1  # every 2 hoursr

  schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
  code = 'twitter.application_search'  # a unique code

  def do(self):
    applications = Application.objects.all()
    responses = []
    for application in applications:
      responses.append(application.search_all_terms())
    print responses