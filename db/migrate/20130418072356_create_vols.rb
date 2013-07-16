# -*- encoding : utf-8 -*-
class CreateVols < ActiveRecord::Migration
  def change
    create_table :vols do |t|
      t.integer :volume
      t.integer :issue

      t.timestamps
    end
  end
end
