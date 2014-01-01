class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
