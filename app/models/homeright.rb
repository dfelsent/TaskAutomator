# -*- encoding : utf-8 -*-
class Homeright < ActiveRecord::Base
   attr_accessible :issuedate, :regulars_attributes

has_many :regulars
#has_many :editorials, :through => :regulars, :dependent => :destroy
accepts_nested_attributes_for :regulars, allow_destroy: true


end
