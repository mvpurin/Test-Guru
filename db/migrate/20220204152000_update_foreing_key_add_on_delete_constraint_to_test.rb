class UpdateForeingKeyAddOnDeleteConstraintToTest < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tests, :categories
    add_foreign_key :tests, :categories, on_delete: :cascade
    
    add_column(:tests, :user_id, :integer)
    add_foreign_key :tests, :users, on_delete: :cascade
  end
end
