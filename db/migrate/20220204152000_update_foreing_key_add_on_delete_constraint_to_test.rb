class UpdateForeingKeyAddOnDeleteConstraintToTest < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tests, :categories
    add_foreign_key :tests, :categories, on_delete: :cascade
  end
end
