class ChangeDateFormatInTable < ActiveRecord::Migration
  def up
  	change_column :checkins, :date, :date
  end

  def down
  	change_column :checkins, :date, :string
  end

end
