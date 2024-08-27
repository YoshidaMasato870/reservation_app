class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :image
      t.string :name
      t.string :info
      t.integer :price
      t.date :check_in
      t.date :check_out
      t.integer :persons
      t.string :user_id

      t.timestamps
    end
  end
end
