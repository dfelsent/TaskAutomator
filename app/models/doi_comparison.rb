# -*- encoding : utf-8 -*-
class DoiComparison < ActiveRecord::Base
  attr_accessible :heather, :hwx
  #attr_accessor :flash_notice

def compare

self.heather = heather.strip.split(/[\s\n\r]+/).map{|cut| cut[1..4]}.sort

self.hwx = hwx.strip.split(/[\s\n\r]+/).map{|cut| cut[-4..-1]}.sort

end

end
