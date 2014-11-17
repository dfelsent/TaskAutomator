class AddMyuseridAndMypassAndMylistToVolJops < ActiveRecord::Migration
  def change
    add_column :vol_jops, :myuserid, :string
    add_column :vol_jops, :mypass, :string
    add_column :vol_jops, :mylist, :text
  end
end
