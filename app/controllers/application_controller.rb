# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: "exampleusername", password: "examplepassword"

end
