class RemoveParticipantsFromChat < ActiveRecord::Migration[7.0]
  def change
    remove_column :chatrooms, :participant_ids
  end
end
