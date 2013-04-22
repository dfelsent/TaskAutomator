class AddArtauthorToMycodes < ActiveRecord::Migration
  def change
    add_column :mycodes, :artauthor, :string

  end
end
