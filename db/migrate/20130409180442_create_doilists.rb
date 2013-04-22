class CreateDoilists < ActiveRecord::Migration
  def change
    create_table :doilists do |t|
      t.text :mylist

      t.timestamps
    end
  end
end
