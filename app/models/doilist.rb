require 'digest'
class Doilist < ActiveRecord::Base

#Note: On 5/6 removed all attr_accessor attributes because they prevented DelayedJob from working properly.		
  #attr_accessor :myuserid, :mypass, :mydate, :mymonth, :myyear, :mylist

		#validates :myuserid, :presence => true
		#validates :mypass, :presence => true
		#validates :mydate, :presence => true, :numericality => true
		#validates :mymonth, :presence => true, :numericality => true
		#validates :myyear, :presence => true, :numericality => true
		#validates :mylist, :presence => true

require 'iconv' unless String.method_defined?(:encode)
if String.method_defined?(:encode)
  file_contents.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
  file_contents.encode!('UTF-8', 'UTF-16')
else
  ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
  file_contents = ic.iconv(file_contents)
end

  def scrape

    agent = Mechanize.new 
    #agent.agent.http.reuse_ssl_sessions = false

    page = agent.get('http://submit.jco.org/')
    #below code added on 7-9-2013
    page.encoding = 'utf-8'
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
      #below code added on 7-9-2013
      page.encoding = 'utf-8'
      entryform = page.form_with(:name => 'submitManuscript') 

      entryform.field_with(:name => 'fixed_embargo_dtmonth').options[("#{mymonth}").to_i].select
      entryform.field_with(:name => 'fixed_embargo_dtday').options[("#{mydate}").to_i].select
      entryform.field_with(:name => 'fixed_embargo_dtyear').options[("#{myyear}").to_i].select

      entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtmonth').options[("#{mymonth}").to_i].select
      entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtday').options[("#{mydate}").to_i].select
      entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtyear').options[("#{myyear}").to_i].select

      page = agent.submit(entryform, entryform.button_with(:name => 'CA_continue'))
      sleep 10.1
    end  
  end

end
