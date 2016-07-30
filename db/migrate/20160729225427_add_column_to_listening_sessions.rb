class AddColumnToListeningSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :listening_sessions, :playlist_owner_id, :string
  end
end
