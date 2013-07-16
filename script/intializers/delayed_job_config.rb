# -*- encoding : utf-8 -*-
Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 2
Delayed::Worker.max_run_time = 20.minutes
#Delayed::Worker.logger = Logger.new(STDOUT)
Delayed::Worker.logger = Rails.logger
Delayed::Worker.logger.auto_flushing = true

RAILS_ENV=production script/delayed_job start
RAILS_ENV=production script/delayed_job stop
