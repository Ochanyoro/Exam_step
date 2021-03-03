class AddCountToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects,:count,:integer
  end
end
