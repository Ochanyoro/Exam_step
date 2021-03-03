class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :image_name
      t.integer :user_id

      t.timestamps
    end
  end
end
