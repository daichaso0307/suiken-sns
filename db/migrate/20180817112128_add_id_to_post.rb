class AddIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :id, :integer
  end
end
