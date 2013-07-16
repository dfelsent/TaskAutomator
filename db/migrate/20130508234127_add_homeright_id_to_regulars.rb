# -*- encoding : utf-8 -*-
class AddHomerightIdToRegulars < ActiveRecord::Migration
  def change
    add_column :regulars, :homeright_id, :integer
  end
end
