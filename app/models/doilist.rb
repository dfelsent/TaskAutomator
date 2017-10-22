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

    mylistarray = mylist.strip.split(/[\s]+/)

    mylistfinal = mylistarray.map{|l| l[8..-1].sub(/(.*)\./,'\1').gsub('.','/')}.uniq

    mylistfinal.each do |doi|
      url ='http://submit.jco.org/tracking/msedit?msid=' + doi + '&roleName=staff_thirteen&msedit=prod_info&show_dates=true#prod_dates' 
  
      b.goto(url)

      b.select_list(:name => 'fixed_embargo_dtmonth').select_value("#{mymonth}")
      b.select_list(:name => 'fixed_embargo_dtday').select_value("#{mydate}")
      b.select_list(:name => 'fixed_embargo_dtyear').select_value("#{myyear}")

      b.select_list(:name => 'fixed_publish_ahead_of_print_dtmonth').select_value("#{mymonth}")
      b.select_list(:name => 'fixed_publish_ahead_of_print_dtday').select_value("#{mydate}")
      b.select_list(:name => 'fixed_publish_ahead_of_print_dtyear').select_value("#{myyear}")

      b.button(:name => 'CA_continue').click

    end  
  end


end
