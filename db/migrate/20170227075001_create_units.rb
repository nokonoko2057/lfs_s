class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :category
      t.float :value
      t.string :image_url
      t.timestamps null: false
    end
  end
end
