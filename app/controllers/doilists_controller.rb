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
  

   
 

  a = Mechanize.new { |agent|
  agent.open_timeout   = 60
  agent.read_timeout   = 60
  }

page = a.get('http://submit.jco.org/')

myform = page.form_with(:name => 'signinForm')

myuserid_field = myform.field_with(:name => "MSTRServlet.emailAddr")
myuserid_field.value = @doilist.myuserid  
mypass_field = myform.field_with(:name => "MSTRServlet.password")
mypass_field.value = @doilist.mypass 

myform.checkbox_with(:name => 'remember_me').check

page = a.submit(myform, myform.buttons.first)

mylistarray = @doilist.mylist.strip.split(/[\s]+/)

mylistfinal = mylistarray.map{|l| l[0..-5].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

mylistfinal.each do |doi|
    url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info&show_dates=true#prod_dates' 
    page = a.get("http://submit.jco.org/submission/queues")
    page = a.get("#{url}") 

    entryform = page.form_with(:name => 'submitManuscript') 

    entryform.field_with(:name => 'fixed_embargo_dtmonth').options[("#{@doilist.mymonth}").to_i].select
    entryform.field_with(:name => 'fixed_embargo_dtday').options[("#{@doilist.mydate}").to_i].select
    entryform.field_with(:name => 'fixed_embargo_dtyear').options[("#{@doilist.myyear}").to_i].select

    entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtmonth').options[("#{@doilist.mymonth}").to_i].select
    entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtday').options[("#{@doilist.mydate}").to_i].select
    entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtyear').options[("#{@doilist.myyear}").to_i].select


    page = a.submit(entryform, entryform.button_with(:name => 'CA_continue'))



end
redirect_to start_index_path, :notice => 'Your form was succesfully submitted!'

end 

 
end
