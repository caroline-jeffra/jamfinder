class ChangeDateToDatetime < ActiveRecord::Migration[7.0]
  def change
    change_column :jam, :date, :datetime
  end
end
