# -*- encoding : utf-8 -*-
class DoiComparisonsController < ApplicationController
  # GET /doi_comparisons
  # GET /doi_comparisons.json

  # GET /doi_comparisons/1
  # GET /doi_comparisons/1.json
  def show
    @doi_comparison = DoiComparison.find(params[:id])
 @doi_comparison.compare
 if @doi_comparison.heather == @doi_comparison.hwx
flash.now[:notice] = "These are a match!"
else
flash.now[:notice] = "There is a mismatch."
end 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doi_comparison }
    end
  end

  # GET /doi_comparisons/new
  # GET /doi_comparisons/new.json
  def new
    @doi_comparison = DoiComparison.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doi_comparison }
    end
  end

  # GET /doi_comparisons/1/edit
  def edit
    @doi_comparison = DoiComparison.find(params[:id])
  end

  # POST /doi_comparisons
  # POST /doi_comparisons.json
  def create
    @doi_comparison = DoiComparison.new(params[:doi_comparison])
    if @doi_comparison.save
        redirect_to @doi_comparison 
      else
        format.html { render action: "new" }
        format.json { render json: @doi_comparison.errors, status: :unprocessable_entity }
      end
    end


  #if cutHeatherArray == cutHwxArray
   # flash[:notice] = "These are a match!"
  #else
  #  flash[:notice] = "There is a mismatch."
  #end
   # end
  #end

  # PUT /doi_comparisons/1
  # PUT /doi_comparisons/1.json
  def update
    @doi_comparison = DoiComparison.find(params[:id])

    respond_to do |format|
      if @doi_comparison.update_attributes(params[:doi_comparison])
        format.html { redirect_to @doi_comparison, notice: 'Doi comparison was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doi_comparison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doi_comparisons/1
  # DELETE /doi_comparisons/1.json
  def destroy
    @doi_comparison = DoiComparison.find(params[:id])
    @doi_comparison.destroy

    respond_to do |format|
      format.html { redirect_to doi_comparisons_url }
      format.json { head :no_content }
    end
  end
end
