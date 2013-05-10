class AddRegularIdToEditorials < ActiveRecord::Migration
  def change
    add_column :editorials, :regular_id, :integer
  end
end
