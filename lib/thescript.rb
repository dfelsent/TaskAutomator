module Thescript
	def myscript
a = Mechanize.new { |agent|
  agent.open_timeout   = 60
  agent.read_timeout   = 60
}

page = a.get('http://submit.jco.org/')

myform = page.form_with(:name => 'signinForm')

username_field = myform.field_with(:name => "MSTRServlet.emailAddr")
username_field.value = "deb.felsenthal@asco.org"
password_field = myform.field_with(:name => "MSTRServlet.password")
password_field.value = "Yellow25@!"

myform.checkbox_with(:name => 'remember_me').check

page = a.submit(myform, myform.buttons.first)

doiorig = %w(
JCO.2012.43.3680.pdf
JCO.2012.43.3680.xml

)

doifinal = doiorig.map{|l| l[0..-5].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

doifinal.each do |doi|
	url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info&show_dates=true#prod_dates' 
page = a.get("http://submit.jco.org/submission/queues")
	page = a.get("#{url}") 


		entryform = page.form_with(:name => 'submitManuscript') 

		entryform.field_with(:name => 'fixed_embargo_dtmonth').options[4].select
		entryform.field_with(:name => 'fixed_embargo_dtday').options[1].select
		entryform.field_with(:name => 'fixed_embargo_dtyear').options[1].select

		entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtmonth').options[4].select
		entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtday').options[1].select
		entryform.field_with(:name => 'fixed_publish_ahead_of_print_dtyear').options[1].select


		page = a.submit(entryform, entryform.button_with(:name => 'CA_continue'))


puts "The DOI " + doi + " was submitted!"
end

end