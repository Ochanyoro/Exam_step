class AddsubjectToRoom < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :subject, foreign_key: true
  end
  def down
    change_column_null :rooms, :subject_id, false
  end

end
