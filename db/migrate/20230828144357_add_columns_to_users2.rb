class AddColumnsToUsers2 < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tagline, :string
    add_column :users, :avatar_url, :string
    add_column :users, :banner_url, :string
    add_column :users, :display_name, :string
  end
end
