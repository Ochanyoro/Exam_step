class AddLevelToSubject < ActiveRecord::Migration[6.1]
  def change
    remove_column :subjects, :level, :integer
    add_column :subjects, :level, :float

  end
end
