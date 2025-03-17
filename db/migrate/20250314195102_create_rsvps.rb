class CreateRsvps < ActiveRecord::Migration[8.0]
  def change
    create_table :rsvps do |t|
      t.string :name
	t.string :phone_number
	  t.string :email
	    t.boolean :present


      t.timestamps
    end
  end
end
