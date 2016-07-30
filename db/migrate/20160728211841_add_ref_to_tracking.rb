class AddRefToTracking < ActiveRecord::Migration[5.0]
  def change
    add_reference :trackings, :user, foreign_key: true
  end
end
