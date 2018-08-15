class AddDeleteFlgToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deleteFlg, :boolean, default: false
  end
end
