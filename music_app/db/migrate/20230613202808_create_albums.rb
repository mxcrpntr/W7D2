class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.references :band, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live?, null: false, default: false

      t.timestamps
    end
    add_index :albums, [:band_id, :title], unique: true
  end
end
