class AddcourseToRoom < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :course, foreign_key: true
  end
  def down
    change_column_null :rooms, :course_id, false
  end

end
