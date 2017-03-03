class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.integer :value
      t.string :unit
      t.string :result
      t.string :image_url
      t.timestamps null: false
    end
  end
end
