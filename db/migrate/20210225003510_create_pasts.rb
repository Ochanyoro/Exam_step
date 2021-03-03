class CreatePasts < ActiveRecord::Migration[6.1]
  def change
    create_table :pasts do |t|
      t.string :name
      t.datetime :post_at
      t.float :level
      t.integer :subject_id

      t.timestamps
    end
  end
end
