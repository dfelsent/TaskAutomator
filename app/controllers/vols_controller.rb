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
  
  a = Mechanize.new { |agent|
  agent.open_timeout   = 60
  agent.read_timeout   = 60
  }

page = a.get('http://submit.jco.org/')

myform = page.form_with(:name => 'signinForm')

myuserid_field = myform.field_with(:name => "MSTRServlet.emailAddr")
myuserid_field.value = @vol.myuserid  
mypass_field = myform.field_with(:name => "MSTRServlet.password")
mypass_field.value = @vol.mypass 

myform.checkbox_with(:name => 'remember_me').check

page = a.submit(myform, myform.buttons.first)

mylistarray = @vol.mylist.strip.split(/[\s]+/)

mylistfinal = mylistarray.map{|l| l[0..-5].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

mylistfinal.each do |doi|
    url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info'
    page = a.get("http://submit.jco.org/submission/queues")
    page = a.get("#{url}") 

    entryform = page.form_with(:name => 'submitManuscript') 

    entryform.field_with(:name => 'assign_to_volume').value = @vol.volume
    entryform.field_with(:name => 'assign_to_issue').value = @vol.issue


    page = a.submit(entryform, entryform.button_with(:name => 'CA_continue'))

end
redirect_to start_index_path, :notice => 'Your form was succesfully submitted!'

end 

 
end
