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
  
  @doilist.scrape
    #webscraper = Webscraper.new
    #webscraper.perform(@doilist)
 
    redirect_to start_index_path, :notice => 'Your form was succesfully submitted!'
  end
 
end
