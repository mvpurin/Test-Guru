class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category, foreign_key: {on_delete: :cascade}
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
