# -*- encoding : utf-8 -*-
class Editorial < ActiveRecord::Base
  attr_accessible :edauthor, :edlink, :regular_id

  belongs_to :regular
  #belongs_to :homeright

end
