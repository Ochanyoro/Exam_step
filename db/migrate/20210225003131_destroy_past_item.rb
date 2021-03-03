class DestroyPastItem < ActiveRecord::Migration[6.1]
  def change
    drop_table:pasts
    drop_table:items
  end
end
