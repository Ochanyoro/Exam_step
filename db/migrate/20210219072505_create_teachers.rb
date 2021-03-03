class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :image_name
      t.integer :course_id
      t.integer :level

      t.timestamps
    end
  end
end
