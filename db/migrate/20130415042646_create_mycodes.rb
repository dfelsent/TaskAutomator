# -*- encoding : utf-8 -*-
class CreateMycodes < ActiveRecord::Migration
  def change
    create_table :mycodes do |t|
      t.text :podtitle
      t.string :speaker
      t.text :wimpy
      t.text :podlink
      t.time :duration
      t.decimal :mbsize
      t.date :date
      t.text :artlink

      t.timestamps
    end
  end
end
