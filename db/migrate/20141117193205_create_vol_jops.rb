class CreateVolJops < ActiveRecord::Migration
  def change
    create_table :vol_jops do |t|
      t.integer :volume
      t.integer :issue

      t.timestamps
    end
  end
end
