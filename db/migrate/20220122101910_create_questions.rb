class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.references :test, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
