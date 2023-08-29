class ChangeDateToDatetime < ActiveRecord::Migration[7.0]
  def change
    change_column :jams, :date, :datetime
  end
end
