# -*- encoding : utf-8 -*-
require 'delayed_job'
class VolJopsController < ApplicationController
  # GET /doilists
  # GET /doilists.json


  # GET /doilists/1
  # GET /doilists/1.json

  # GET /doilists/new
  # GET /doilists/new.json
  def new
    @vol_jop = VolJop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vol_jop }
    end
  end

  # POST /doilists
  # POST /doilists.json
  def create
    @vol_jop = VolJop.new(vol_jop_params)
    
    if @vol_jop.save
      Delayed::Job.enqueue VolJopScrapeJob.new(@vol_jop.id)
        flash[:notice] = "Your entries have been sent."
        redirect_to start_index_path 
      else
        render :action => 'new'
        format.html { render action: "new" }
        format.json { render json: @vol_jop.errors, status: :unprocessable_entity }
      end
  end

  private
  def vol_jop_params
    params.require(:vol_jop).permit(:myuserid, :mypass, :mylist, :volume, :issue)
  end

end
