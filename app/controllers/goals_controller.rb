class GoalsController < ApplicationController

	def index
#		@goals = current_user.goals #add this back in
	end 

#		@habit = current_user.habits.build #Habit.new

	def new 
		@goal = Goal.new #current_user.goals.build

	end

	def create
		@goal = current_user.goals.build(goal_params)

		if @goal.save
			redirect_to goals_path
		else
			flash.now[:error] = goal.errors.messages.first.join(' ')
		end
	end

	private
	def goal_params
		params.require(:goal).permit(:goal_type, :description, :position) 
	end

end