class AddIsClockedBoolean < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :clocked_in, :boolean, default: false
  end
end
