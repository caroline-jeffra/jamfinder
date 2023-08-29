class CreateAudios < ActiveRecord::Migration[7.0]
  def change
    create_table :audios do |t|
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end