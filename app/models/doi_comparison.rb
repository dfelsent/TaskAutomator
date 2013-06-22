class DoiComparison < ActiveRecord::Base
  attr_accessible :heather, :hwx
  #attr_accessor :flash_notice

def compare
#heatherArray = %w(heather)

self.heather = heather.strip.split(/[\s\n\r]+/).map{|cut| cut[1..4]}.sort

#hwxArray = %w(hwx)

self.hwx = hwx.strip.split(/[\s\n\r]+/).map{|cut| cut[-4..-1]}.sort

end

end
