# -*- encoding : utf-8 -*-
#note from 7-26: maybe i should put this in a dev config file?

if defined?(Rails) && Rails.env.development?
  #puts '... ActiveRecord and ActiveResource Logger set to STDOUT'
  logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = logger
  ActiveResource::Base.logger = logger
  Delayed::Worker.logger = logger
  Delayed::Job.logger = logger


file_handle = File.open("log/#{Rails.env}_delayed_jobs.log", (File::WRONLY | File::APPEND | File::CREAT))
# Be paranoid about syncing, part #1
file_handle.sync = true
# Be paranoid about syncing, part #2
#Rails.logger.auto_flushing = true
# Hack the existing Rails.logger object to use our new file handle
Rails.logger.instance_variable_set :@log, file_handle
# Calls to Rails.logger go to the same object as Delayed::Worker.logger
Delayed::Worker.logger = Rails.logger

end