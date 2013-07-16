# -*- encoding : utf-8 -*-
class Regular < ActiveRecord::Base
   attr_accessible :title, :author, :link, :homeright_id, :editorials_attributes

belongs_to :homeright
has_many :editorials
accepts_nested_attributes_for :editorials, :allow_destroy => true

end
