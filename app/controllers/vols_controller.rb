# -*- encoding : utf-8 -*-
require 'delayed_job'
class VolsController < ApplicationController
  # GET /doilists
  # GET /doilists.json


  # GET /doilists/1
  # GET /doilists/1.json

  # GET /doilists/new
  # GET /doilists/new.json
  def new
    @vol = Vol.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vol }
    end
  end

  # POST /doilists
  # POST /doilists.json
  def create
    @vol = Vol.new(params[:vol])
    
    if @vol.save
      Delayed::Job.enqueue VolScrapeJob.new(@vol.id)
        flash[:notice] = "Your entries have been sent."
        redirect_to start_index_path 
      else
        render :action => 'new'
        format.html { render action: "new" }
        format.json { render json: @vol.errors, status: :unprocessable_entity }
      end
  end
end
