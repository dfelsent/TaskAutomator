# -*- encoding : utf-8 -*-
class CreateDoiComparisons < ActiveRecord::Migration
  def change
    create_table :doi_comparisons do |t|
      t.text :heather
      t.text :hwx

      t.timestamps
    end
  end
end
