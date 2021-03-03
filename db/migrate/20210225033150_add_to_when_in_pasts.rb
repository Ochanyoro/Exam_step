class AddToWhenInPasts < ActiveRecord::Migration[6.1]
  def change
    add_column :pasts,:when,:string
  end
end
