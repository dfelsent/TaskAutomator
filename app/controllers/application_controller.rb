class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :force_ssl


end
