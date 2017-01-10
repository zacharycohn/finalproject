class AddTypeColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :type, :string
  end
end
