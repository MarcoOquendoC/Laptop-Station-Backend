class CreateReserves < ActiveRecord::Migration[7.0]
  def change
    create_table :reserves do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
