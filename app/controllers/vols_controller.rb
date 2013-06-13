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

  # POST /doilists
  # POST /doilists.json
  def create
    @vol = Vol.new(params[:vol])

    if @vol.save
        @vol.delay.scrape 
        @vol.delay.destroy
        flash[:notice] = "Your entries have been sent."
        redirect_to start_index_path 
      else
        render :action => 'new'
        format.html { render action: "new" }
        format.json { render json: @vol.errors, status: :unprocessable_entity }
      end
  end
end
