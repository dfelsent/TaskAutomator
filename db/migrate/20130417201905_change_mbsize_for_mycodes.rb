# -*- encoding : utf-8 -*-
class ChangeMbsizeForMycodes < ActiveRecord::Migration
  change_table :mycodes do |t|  
        t.change :mbsize, :decimal, :precision => 10, :scale => 4 
    end
end
