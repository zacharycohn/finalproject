class HabitsController < ApplicationController
	
	def index
		if params.key? :name
			@habit = Habit.where(name: params[:name])
		elsif params.key? :active
			@habit = Habit.where(active: params[:active])
#		elsif params.key? "stats"

		else #daily
			@habit = Habit.all
		end
	end

	def new
		@habit = Habit.new
	end

	def create
		@habit = Habit.new(habit_params)
		@habit[:active] = "true"
		
		if @habit.save
			redirect_to habits_path #+ "#" + "#{@habit.name}"
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

	def show
		# @habit = Habit.all? { |h|  }

	end

	private
		def habit_params
			params.require(:habit).permit(:name, :active)
		end
end
