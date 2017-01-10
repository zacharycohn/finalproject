class AddUserIdToGoals < ActiveRecord::Migration
  def change
  	add_column "goals", "user_id", :integer
  	rename_column "goals", "type", "goal_type"
  end
end
