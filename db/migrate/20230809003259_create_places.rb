class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.binary :external_id, limit: 16, null: false
      t.string :city, null: false
      t.string :name, null: false
      t.string :address, null: false

      t.timestamps
    end
    add_index :places, :external_id, unique: true
    add_index :places, [:city, :name]
  end
end
