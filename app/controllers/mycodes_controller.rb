class MycodesController < ApplicationController
  # GET /mycodes
  # GET /mycodes.json
 

  def index
    @mycodes = Mycode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mycodes }
    end
  end

  # GET /mycodes/1
  # GET /mycodes/1.json
  def show
    @mycode = Mycode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mycode }
    end
  end

  # GET /mycodes/new
  # GET /mycodes/new.json
  def new
    @mycode = Mycode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mycode }
    end
  end

  # GET /mycodes/1/edit
  def edit
    @mycode = Mycode.find(params[:id])
  end

  # POST /mycodes
  # POST /mycodes.json
  def create
    @mycode = Mycode.new(params[:mycode])



    respond_to do |format|
      if @mycode.save
        format.html { redirect_to @mycode, notice: 'Your code was successfully generated.' }
        format.json { render json: @mycode, status: :created, location: @mycode }
      else
        format.html { render action: "new" }
        format.json { render json: @mycode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mycodes/1
  # PUT /mycodes/1.json
  def update
    @mycode = Mycode.find(params[:id])

    respond_to do |format|
      if @mycode.update_attributes(params[:mycode])
        format.html { redirect_to @mycode, notice: 'Your code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mycode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mycodes/1
  # DELETE /mycodes/1.json
  def destroy
    @mycode = Mycode.find(params[:id])
    @mycode.destroy

    respond_to do |format|
      format.html { redirect_to mycodes_url }
      format.json { head :no_content }
    end
  end
end
