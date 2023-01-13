class AddPassedTestToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :passed_tests, :integer, array: true, default: []
  end
end
