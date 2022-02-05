class CreateTestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users do |t|
      t.belongs_to :test
      t.belongs_to :user
    end
  end
end