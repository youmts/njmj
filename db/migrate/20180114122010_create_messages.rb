class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :room, foreign_key: true, null: false
      t.belongs_to :player, foreign_key: true, null: false

      t.timestamps
    end
  end
end
