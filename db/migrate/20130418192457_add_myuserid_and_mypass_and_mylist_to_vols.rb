class AddMyuseridAndMypassAndMylistToVols < ActiveRecord::Migration
  def change
    add_column :vols, :myuserid, :string

    add_column :vols, :mypass, :string

    add_column :vols, :mylist, :text

  end
end
