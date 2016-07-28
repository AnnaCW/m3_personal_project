class CreateTrackings < ActiveRecord::Migration[5.0]
  def change
    create_table :trackings do |t|
      t.string :item_name
      t.string :item_type
      t.string :item_id
      t.string :rating
      t.text :notes

      t.timestamps
    end
  end
end
