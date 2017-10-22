# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: "asco", password: "jcojop"

end
