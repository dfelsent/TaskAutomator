class CreateRegulars < ActiveRecord::Migration
  def change
    create_table :regulars do |t|

      t.timestamps
    end
  end
end
