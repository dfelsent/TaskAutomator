require 'digest'
class Doilist < ActiveRecord::Base


		attr_accessor :myuserid
		attr_accessor :mypass
		attr_accessor :mydate
		attr_accessor :mymonth
		attr_accessor :myyear
		attr_accessor :mylist

		validates :myuserid, :presence => true
		validates :mypass, :presence => true
		validates :mydate, :presence => true, :numericality => true
		validates :mymonth, :presence => true, :numericality => true
		validates :myyear, :presence => true, :numericality => true
		validates :mylist, :presence => true

  def scrape


a = Mechanize.new { |agent|
  agent.open_timeout   = 180
  agent.read_timeout   = 180
  }

page = a.get('http://submit.jco.org/')

myform = page.form_with(:name => 'signinForm')

myuserid_field = myform.field_with(:name => "MSTRServlet.emailAddr")
myuserid_field.value = myuserid  
mypass_field = myform.field_with(:name => "MSTRServlet.password")
mypass_field.value = mypass 

myform.checkbox_with(:name => 'remember_me').check

page = a.submit(myform, myform.buttons.first)

mylistarray = mylist.strip.split(/[\s]+/)

mylistfinal = mylistarray.map{|l| l[0..-5].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

mylistfinal.each do |doi|
    url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info&show_dates=true#prod_dates' 
    page = a.get("http://submit.jco.org/submission/queues")
    page = a.get("#{url}") 

    entryform = page.form_with(:name => 'submitManuscript') 

    entryform.field_with(:name => 'fixed_embargo_dtmonth').options[("#{mymonth}").to_i].select
    entryform.field_with(:name => 'fixed_embargo_dtday').options[("#{mydate}").to_i].select
    entryform.field_with(:name => 'fixed_embargo_dtyear').options[("#{myyear}").to_i].select

    entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtmonth').options[("#{mymonth}").to_i].select
    entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtday').options[("#{mydate}").to_i].select
    entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtyear').options[("#{myyear}").to_i].select


    page = a.submit(entryform, entryform.button_with(:name => 'CA_continue'))



end


  end


before_save :destroy_record

def destroy_record
	false
end


	


end
