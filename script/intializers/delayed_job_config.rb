Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 2
Delayed::Worker.max_run_time = 20.minutes

RAILS_ENV=production script/delayed_job start
RAILS_ENV=production script/delayed_job stop