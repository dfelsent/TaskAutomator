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

  


before_save :destroy_record

def destroy_record
	false
end


	


end
