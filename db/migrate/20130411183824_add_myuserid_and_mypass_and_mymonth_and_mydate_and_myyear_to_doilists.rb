class AddMyuseridAndMypassAndMymonthAndMydateAndMyyearToDoilists < ActiveRecord::Migration
  def change
    add_column :doilists, :myuserid, :string

    add_column :doilists, :mypass, :string

    add_column :doilists, :mymonth, :integer

    add_column :doilists, :mydate, :integer

    add_column :doilists, :myyear, :integer

  end
end
