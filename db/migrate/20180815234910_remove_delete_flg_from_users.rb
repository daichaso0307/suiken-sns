class RemoveDeleteFlgFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deleteFlg, :boolean
  end
end
