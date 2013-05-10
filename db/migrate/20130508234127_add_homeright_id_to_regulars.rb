class AddHomerightIdToRegulars < ActiveRecord::Migration
  def change
    add_column :regulars, :homeright_id, :integer
  end
end
