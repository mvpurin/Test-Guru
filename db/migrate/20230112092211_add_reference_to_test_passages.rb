class AddReferenceToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_reference :test_passages, :badge, foreign_key: {to_table: :badges}
  end
end
