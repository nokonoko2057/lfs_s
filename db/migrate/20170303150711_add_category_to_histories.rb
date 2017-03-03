class AddCategoryToHistories < ActiveRecord::Migration[5.0]
  def change
    add_column :histories, :category, :string
  end
end
