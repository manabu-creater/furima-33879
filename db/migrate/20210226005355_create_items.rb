class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :price
      t.text :detail
      t.integer :condition_id
      t.integer :delivery_area_id
      t.integer :delivery_bear_id
      t.integer :delivery_day_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
