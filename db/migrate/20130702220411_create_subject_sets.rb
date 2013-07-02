class CreateSubjectSets < ActiveRecord::Migration
  def change
    create_table :subject_sets do |t|
      t.text :subject_codes

      t.timestamps
    end
  end
end
