class ChangeColumnToPlayer < ActiveRecord::Migration[5.1]
  def up
    change_column :players, :room_id, :bigint, null: false
  end

  def down
    change_column :players, :room_id, :bigint
  end
end
