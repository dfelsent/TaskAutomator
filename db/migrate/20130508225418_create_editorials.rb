# -*- encoding : utf-8 -*-
class CreateEditorials < ActiveRecord::Migration
  def change
    create_table :editorials do |t|
      t.string :edauthor
      t.text :edlink

      t.timestamps
    end
  end
end
