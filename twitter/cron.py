from django_cron import CronJobBase, Schedule
from twitter.models import Application

class ApplicationSearch(CronJobBase):
  RUN_EVERY_MINS = 15

  schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
  code = 'twitter.application_search'  # a unique code

  def do(self):
    applications = Application.objects.all()
    for application in applications:
      message = "cron job triggered for application '%s'" % application
      print message
      application.logger.info(message)
      application.search_all_terms()