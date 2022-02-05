class AddTestsToUserAddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :test_id, :integer)
    add_foreign_key :users, :tests, on_delete: :cascade
  end
end
