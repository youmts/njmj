class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps
    end

    add_reference :players, :room, foreign_key: true
  end
end
