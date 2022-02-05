class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tests, :users

    add_foreign_key :tests_users, :users
    add_foreign_key :tests_users, :tests
  end
end
