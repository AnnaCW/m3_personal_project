class AddColumnsToListeningSession < ActiveRecord::Migration[5.0]
  def change
    add_column :listening_sessions, :agitation_before, :integer
    add_column :listening_sessions, :agitation_after, :integer
    add_column :listening_sessions, :awareness_before, :integer
    add_column :listening_sessions, :awareness_after, :integer
    add_column :listening_sessions, :communicativeness_before, :integer
    add_column :listening_sessions, :communicativeness_after, :integer
    add_column :listening_sessions, :duration, :integer
    remove_column :listening_sessions, :rating, :string
  end
end
