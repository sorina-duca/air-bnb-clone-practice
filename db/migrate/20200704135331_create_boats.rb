class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :description
      t.integer :capacity
      t.string :location
      t.integer :price
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
