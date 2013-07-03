require 'delayed_job'
class DoilistsController < ApplicationController
  # GET /doilists
  # GET /doilists.json


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
  
      if @doilist.save
        #flash[:notice] = "Successfully submitted your entry."
        @doilist.delay.scrape
        #@doilist.delay.destroy
        flash[:notice] = "Your entries have been sent."
        redirect_to start_index_path 
      else
        render :action => 'new'
        format.html { render action: "new" }
        format.json { render json: @doilist.errors, status: :unprocessable_entity }
  
      end
    end

end