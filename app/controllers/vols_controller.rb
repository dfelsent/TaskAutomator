require 'delayed_job'
class VolsController < ApplicationController
  # GET /doilists
  # GET /doilists.json

  def index
    @vols = Vol.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vols }
    end
  end

  # GET /doilists/1
  # GET /doilists/1.json
  def show
    @vol = Vol.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vol }
    end
  end

  # GET /doilists/new
  # GET /doilists/new.json
  def new
    @vol = Vol.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vol }
    end
  end

  # GET /doilists/1/edit
  

  # POST /doilists
  # POST /doilists.json
  def create
    @vol = Vol.new(params[:vol])

    if @vol.save
        #flash[:notice] = "Successfully submitted your entry."
        @vol.delay.scrape 
        flash[:notice] = "Submitting your info to Benchpress"
        redirect_to start_index_path 
        #redirect_to start_index_path, flash[:notice] => 'Your form was succesfully submitted!'
        #redirect_to waitforit

       # Delayed::Job.enqueue(ScrapeJob.new(params[:id]))
        #@doilist.delay.scrape
        #format.html { redirect_to @doilist, notice: 'Your form was successfully submitted!' }
       # format.json { render json: @doilist, status: :created, location: @doilist }
      else
        render :action => 'new'
        format.html { render action: "new" }
        format.json { render json: @vol.errors, status: :unprocessable_entity }
      end
  end
end
