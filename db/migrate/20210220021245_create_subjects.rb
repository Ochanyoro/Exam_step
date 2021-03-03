class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :image_name
      t.integer :teacher_id
      t.integer :level

      t.timestamps
    end
  end
end
