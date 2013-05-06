require 'digest'
class Doilist < ActiveRecord::Base

#doilist = Doilist.find(doilist_id)
  #doilist.delay(:scrape)

#after_save do |doilist|
 # doilist = Doilist.find(doilist_id)
  #doilist.delay.scrape
  #runscript.delay.scrape(params[:doilist])
  #flash[:notice] = "Currently sending your entry"
#end

#after_save :scrape 
#after_commit :destroy

#def self.scrape(id)
 # find(id).scrape
#end

#Note: On 5/6 removed all attr_accessor attributes because they prevented DelayedJob from working properly.		
  #attr_accessor :myuserid, :mypass, :mydate, :mymonth, :myyear, :mylist

		validates :myuserid, :presence => true
		validates :mypass, :presence => true
		validates :mydate, :presence => true, :numericality => true
		validates :mymonth, :presence => true, :numericality => true
		validates :myyear, :presence => true, :numericality => true
		validates :mylist, :presence => true

  def scrape

    agent = Mechanize.new 
    #agent.agent.http.reuse_ssl_sessions = false

    page = agent.get('http://submit.jco.org/')

    myform = page.form_with(:name => 'signinForm')

    myuserid_field = myform.field_with(:name => "MSTRServlet.emailAddr")
    myuserid_field.value = myuserid  
    mypass_field = myform.field_with(:name => "MSTRServlet.password")
    mypass_field.value = mypass 

    myform.checkbox_with(:name => 'remember_me').check

    page = agent.submit(myform, myform.buttons.first)

    mylistarray = mylist.strip.split(/[\s]+/)

    mylistfinal = mylistarray.map{|l| l[0..-5].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

    mylistfinal.each do |doi|
      url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info&show_dates=true#prod_dates' 
      page = agent.get("http://submit.jco.org/submission/queues")
      page = agent.get("#{url}") 

      entryform = page.form_with(:name => 'submitManuscript') 

      entryform.field_with(:name => 'fixed_embargo_dtmonth').options[("#{mymonth}").to_i].select
      entryform.field_with(:name => 'fixed_embargo_dtday').options[("#{mydate}").to_i].select
      entryform.field_with(:name => 'fixed_embargo_dtyear').options[("#{myyear}").to_i].select

      entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtmonth').options[("#{mymonth}").to_i].select
      entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtday').options[("#{mydate}").to_i].select
      entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtyear').options[("#{myyear}").to_i].select


      page = agent.submit(entryform, entryform.button_with(:name => 'CA_continue'))

    end 
    #redirect_to start_index_path, :notice => 'Your form was succesfully submitted!'
    #Delayed::Job.destroy_all
  end
  #handle_asynchronously :scrape


#before_save :destroy_record

#def destroy_record
#	false
#end

end
