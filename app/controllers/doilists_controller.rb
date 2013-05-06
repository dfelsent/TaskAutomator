require 'delayed_job'
class DoilistsController < ApplicationController
  # GET /doilists
  # GET /doilists.json

  def index
    @doilists = Doilist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @doilists }
    end
  end

  # GET /doilists/1
  # GET /doilists/1.json
  def show
    @doilist = Doilist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doilist }
    end
  end

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
    @doilist = Doilist.new(params[:doilist])
  
  #@doilist.delay.scrape
    #webscraper = Webscraper.new
    #webscraper.perform(@doilist)
    #respond_to do |format|
      if @doilist.save
        #flash[:notice] = "Successfully submitted your entry."
        @doilist.delay.scrape 
        flash[:notice] = "Currently sending your info"
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
        format.json { render json: @doilist.errors, status: :unprocessable_entity }
  
      end
    end
end