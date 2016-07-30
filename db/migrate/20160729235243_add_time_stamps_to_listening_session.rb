class AddTimeStampsToListeningSession < ActiveRecord::Migration[5.0]
  def change
    add_column :listening_sessions, :created_at, :datetime
    add_column :listening_sessions, :updated_at, :datetime
  end
end
