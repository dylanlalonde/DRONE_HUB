class AddCategoryToDrones < ActiveRecord::Migration[5.2]
  def change
    add_column :drones, :category, :string
  end
end
