class CreateRsvps < ActiveRecord::Migration[8.0]
  def change
    create_table :rsvps do |t|
      t.string :first_name
      t.string :last_name
      t.integer :guests
      t.string :phone_number
      t.string :email
      t.boolean :present
      t.string :dietary_restrictions


      t.timestamps
    end
  end
end
