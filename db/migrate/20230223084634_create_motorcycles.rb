class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :name
      t.text :description
      t.string :img_url
      t.string :model_year
      t.decimal :price
      t.string :engine
      t.string :fuel_type
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
