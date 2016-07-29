class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :trackings
    drop_table :playlists
    drop_table :listens
  end
end
