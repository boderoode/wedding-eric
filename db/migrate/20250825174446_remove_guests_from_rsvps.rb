class RemoveGuestsFromRsvps < ActiveRecord::Migration[8.0]
  def change
    remove_column :rsvps, :guests, :integer
  end
end
