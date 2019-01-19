class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.integer :user_id
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
