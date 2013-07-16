# -*- encoding : utf-8 -*-
class HomerightsController < ApplicationController
  # GET /homerights
  # GET /homerights.json
  def index
    @homerights = Homeright.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homerights }
    end
  end

  # GET /homerights/1
  # GET /homerights/1.json
  def show
    @homeright = Homeright.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homeright }
    end
  end

  # GET /homerights/new
  # GET /homerights/new.json
  def new
   @homeright = Homeright.new
   
  #3.times do
   # regular = @homeright.regulars.build
   # 1.times  { regular.build_editorial }
  #end
  end

  # GET /homerights/1/edit
  def edit
    @homeright = Homeright.find(params[:id])
  end

  # POST /homerights
  # POST /homerights.json
  def create
    @homeright = Homeright.new(params[:homeright])

    respond_to do |format|
      if @homeright.save
        format.html { redirect_to @homeright, notice: 'Homeright was successfully created.' }
        format.json { render json: @homeright, status: :created, location: @homeright }
      else
        format.html { render action: "new" }
        format.json { render json: @homeright.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homerights/1
  # PUT /homerights/1.json
  def update
    @homeright = Homeright.find(params[:id])

    respond_to do |format|
      if @homeright.update_attributes(params[:homeright])
        format.html { redirect_to @homeright, notice: 'Homeright was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @homeright.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homerights/1
  # DELETE /homerights/1.json
  def destroy
    @homeright = Homeright.find(params[:id])
    @homeright.destroy

    respond_to do |format|
      format.html { redirect_to homerights_url }
      format.json { head :no_content }
    end
  end
end
