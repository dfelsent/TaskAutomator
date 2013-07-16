# -*- encoding : utf-8 -*-
 class StartController < ApplicationController

 def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @start }
    end
  end

end
