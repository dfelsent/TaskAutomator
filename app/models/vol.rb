# -*- encoding : utf-8 -*-
require 'digest'
class Vol < ActiveRecord::Base

validates :myuserid, :presence => true
validates :mypass, :presence => true
validates :mylist, :presence => true
validates :volume, :presence => true, :numericality => true
validates :issue, :presence => true,:numericality => true


def scrape
  
    b = Watir::Browser.new :phantomjs
    b.goto 'submit.jco.org'
    b.text_field(id:'signinEmail').set(myuserid)
    b.text_field(id:'signinPassword').set(mypass)
    b.button(name:'login').click  
# a = Mechanize.new 

# page = a.get('http://submit.jco.org/')

# myform = page.form_with(:name => 'signinForm')

# myuserid_field = myform.field_with(:name => "MSTRServlet.emailAddr")
# myuserid_field.value = myuserid  
# mypass_field = myform.field_with(:name => "MSTRServlet.password")
# mypass_field.value = mypass 

# myform.checkbox_with(:name => 'remember_me').check

# page = a.submit(myform, myform.buttons.first)

mylistarray = mylist.strip.split(/[\s]+/)

mylistfinal = mylistarray.map{|l| l}.uniq

mylistfinal.each do |doi|
    url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff&msedit=prod_info'
    # page = a.get("http://submit.jco.org/submission/queues")
    # page = a.get("#{url}") 
    b.goto(url)
 
   # entryform = page.form_with(:name => 'submitManuscript') 
	b.text_field(:name => 'assign_to_volume').set(volume)
	b.text_field(:name => 'assign_to_issue').set(issue)
    #entryform.field_with(:name => 'assign_to_volume').value = volume
    #entryform.field_with(:name => 'assign_to_issue').value = issue

    #page = a.submit(entryform, entryform.button_with(:name => 'CA_continue'))
	b.button(name:'CA_continue').click
end

end 


end

