class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.references :question, foreign_key: {on_delete: :cascade}
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
