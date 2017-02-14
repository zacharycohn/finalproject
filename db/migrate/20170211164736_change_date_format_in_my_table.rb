class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
  	change_column :checkins, :date, :datetime 
  end

  def down
  	change_column :checkins, :date, :string
  end

end
