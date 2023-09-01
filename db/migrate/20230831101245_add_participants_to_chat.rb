class AddParticipantsToChat < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :participant_ids, :integer, array: true, default: [] 
  end
end
