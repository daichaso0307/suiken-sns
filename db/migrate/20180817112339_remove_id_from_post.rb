class RemoveIdFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :id, :integer
  end
end
