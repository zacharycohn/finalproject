class GoalsController < ApplicationController
	
	def index

	end 

#		@habit = current_user.habits.build #Habit.new #current_user.habits.build

	def new 
		@goal = Goal.new #current_user.goals.build
	end

	def create
		@goal = current_user.goals.build(goal_params)

		if @goal.save
			redirect_to new_goal_path
		else
			flash.now[:error] = goal.errors.messages.first.join(' ')
		end
	end

	private
	def goal_params
		params.require(:goal).permit(:type, :description, :position) 
	end

end
