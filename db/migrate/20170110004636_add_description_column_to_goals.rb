class AddDescriptionColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :description, :string
  end
end
