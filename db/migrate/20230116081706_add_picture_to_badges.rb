class AddPictureToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :picture, :string
  end
end
