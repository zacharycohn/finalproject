class HabitsController < ApplicationController
	
	def index
		
	end

	def today
		@habits = current_user.habits.where(active: "true") #Habit.all.active #current_user.habits.where(...)
	end

	def new
		@habit = current_user.habits.build #Habit.new #current_user.habits.build
	end

	def create
		@habit = current_user.habits.build(habit_params) #Habit.new(habit_params) #current_user.habits.build(...)
		@habit[:active] = "true"
		
		if @habit.save
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

	def week
		@habits = current_user.habits.where(active: "true") #Habit.all.active
	end

	def stats
#		@stats = params[:stats]
		@stats = current_user.habits.find(params[:habit_id])
	end


	private
		def habit_params
			params.require(:habit).permit(:name, :active)
		end
end
