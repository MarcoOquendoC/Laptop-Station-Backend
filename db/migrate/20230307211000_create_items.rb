class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :item_model
      t.string :serial_n, default: '0000'
      t.string :image, default: 'default.jpg'
      t.text :description
      t.string :brand

      t.timestamps
    end
  end
end
