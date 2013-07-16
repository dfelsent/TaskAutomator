# -*- encoding : utf-8 -*-
class CreateHomerights < ActiveRecord::Migration
  def change
    create_table :homerights do |t|

      t.timestamps
    end
  end
end
