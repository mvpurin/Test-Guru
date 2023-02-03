class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :body
      t.string :picture
      t.string :rule
      t.string :params
      t.references :author, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
