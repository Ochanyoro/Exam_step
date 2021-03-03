class AddBadToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :bad, :integer
  end
end
