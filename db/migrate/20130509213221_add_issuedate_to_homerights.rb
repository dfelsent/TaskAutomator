# -*- encoding : utf-8 -*-
class AddIssuedateToHomerights < ActiveRecord::Migration
  def change
    add_column :homerights, :issuedate, :date
  end
end
