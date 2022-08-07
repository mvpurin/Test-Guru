class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
    remove_column :users, :name
  end
end
