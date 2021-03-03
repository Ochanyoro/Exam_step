class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :like
      t.integer :subject_id

      t.timestamps
    end
  end
end
