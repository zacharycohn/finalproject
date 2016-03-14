class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :habit_id
      t.string :status
      t.string :date
      t.string :description

      t.timestamps null: false
    end
  end
end
