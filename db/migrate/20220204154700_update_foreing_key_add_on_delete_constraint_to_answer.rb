class UpdateForeingKeyAddOnDeleteConstraintToAnswer < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :answers, :questions
    add_foreign_key :answers, :questions, on_delete: :cascade
  end
end
