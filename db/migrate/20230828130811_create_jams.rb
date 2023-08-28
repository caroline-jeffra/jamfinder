class CreateJams < ActiveRecord::Migration[7.0]
  def change
    create_table :jams do |t|
      t.date :date
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :did_happen

      t.timestamps
    end
  end
end
