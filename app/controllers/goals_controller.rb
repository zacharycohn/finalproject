class GoalsController < ApplicationController
	
	def index

	end 

#		@habit = current_user.habits.build #Habit.new #current_user.habits.build

	def new 
#		@goal = current_user.goal.build
		@goal = Goal.new
	end

	def create
		@goal = current_user.Goal.build(goal_params)

		if @goal.save
			redirect_to habit_goals
		else
			flash.now[:error] = goal.errors.messages.first.join(' ')
		end
	end

	private
	def goal_params
		params.require(:user).permit(:type, :description, :position) 
	end

end
