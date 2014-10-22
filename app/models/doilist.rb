# -*- encoding : utf-8 -*-
require 'digest'
class Doilist < ActiveRecord::Base

#Note: On 5/6 removed all attr_accessor attributes because they prevented DelayedJob from working properly.		
  #attr_accessor :myuserid, :mypass, :mydate, :mymonth, :myyear, :mylist

		validates :myuserid, :presence => true
		validates :mypass, :presence => true
		validates :mydate, :presence => true, :numericality => true
		validates :mymonth, :presence => true, :numericality => true
		validates :myyear, :presence => true, :numericality => true
		validates :mylist, :presence => true

  def scrape

    b = Watir::Browser.new :phantomjs
    b.goto 'submit.jco.org'
    b.text_field(id:'signinEmail').set(myuserid)
    b.text_field(id:'signinPassword').set(mypass)
    b.button(name:'login').click

    #agent = Mechanize.new
    #page = agent.get('http://submit.jco.org/')
    #page.encoding = 'utf-8'
    #myform = page.form_with(:name => 'signinForm')

    # myuserid_field = myform.field_with(:name => "MSTRServlet.emailAddr")
    # myuserid_field.value = myuserid  
    # mypass_field = myform.field_with(:name => "MSTRServlet.password")
    # mypass_field.value = mypass 

    # myform.checkbox_with(:name => 'remember_me').check
    # page = agent.submit(myform, myform.buttons.first)
    # page.encoding = 'utf-8'
   # mylistnew = mylist.encode('UTF-16le', :invalid => :replace, :replace => '').encode('UTF-8')
    mylistarray = mylist.strip.split(/[\s]+/)

    mylistfinal = mylistarray.map{|l| l[0..-5].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

    mylistfinal.each do |doi|
      url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info&show_dates=true#prod_dates' 
      #page = agent.get("http://submit.jco.org/submission/queues")
      # page = agent.get("#{url}")
      b.goto(url)
      #page.encoding = 'utf-8'
      #entryform = page.form_with(:name => 'submitManuscript') 
      b.select_list(:name => 'fixed_embargo_dtmonth').select_value("#{mymonth}")
      b.select_list(:name => 'fixed_embargo_dtday').select_value("#{mydate}")
      b.select_list(:name => 'fixed_embargo_dtyear').select_value("#{myyear}")

      b.select_list(:name => 'fixed_publish_ahead_of_print_dtmonth').select_value("#{mymonth}")
      b.select_list(:name => 'fixed_publish_ahead_of_print_dtday').select_value("#{mydate}")
      b.select_list(:name => 'fixed_publish_ahead_of_print_dtyear').select_value("#{myyear}")


      # entryform.field_with(:name => 'fixed_embargo_dtmonth').options[("#{mymonth}").to_i].select
      # entryform.field_with(:name => 'fixed_embargo_dtday').options[("#{mydate}").to_i].select
      # entryform.field_with(:name => 'fixed_embargo_dtyear').options[("#{myyear}").to_i].select

      # entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtmonth').options[("#{mymonth}").to_i].select
      # entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtday').options[("#{mydate}").to_i].select
      # entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtyear').options[("#{myyear}").to_i].select

      b.button(:name => 'CA_continue').click

      #page = agent.submit(entryform, entryform.button_with(:name => 'CA_continue'))
      #sleep 2
    end  
  end

end
