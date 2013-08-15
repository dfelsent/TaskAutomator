# -*- encoding : utf-8 -*-
require 'delayed_job'
class DoilistsController < ApplicationController
  # GET /doilists
  # GET /doilists.json


  # GET /doilists/1
  # GET /doilists/1.json

  # GET /doilists/new
  # GET /doilists/new.json
  def new
    @doilist = Doilist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doilist }
    end
  end

  # GET /doilists/1/edit
  
  # POST /doilists
  # POST /doilists.json
   def create
    @doilist = Doilist.new(doilist_params)
  
      if @doilist.save
        Delayed::Job.enqueue DoilistScrapeJob.new(@doilist.id)
        flash[:notice] = "Your entries have been sent."
        redirect_to start_index_path
      else
        render :action => 'new'
        format.html { render action: "new" }
        format.json { render json: @doilist.errors, status: :unprocessable_entity }

      end
    end

    private
    def doilist_params
      params.require(:doilist).permit(:myuserid, :mypass, :mydate, :mymonth, :myyear, :mylist)
    end

end
