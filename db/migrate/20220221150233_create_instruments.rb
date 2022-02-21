class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.integer :rating
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
