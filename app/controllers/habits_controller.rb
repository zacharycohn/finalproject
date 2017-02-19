class HabitsController < ApplicationController
	
	def index

		if params[:year].nil? or params[:month].nil? or params[:day].nil?
			@checkinDate = 	Date.current
		else
			begin
				@checkinDate = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
			rescue
				render :text => "time is broken" and return
			end
		end

		@next_week = @checkinDate + 7.days
		@last_week = @checkinDate - 7.days

		@habits = current_user.habits.where(active: "true")
	end

	def new	
		@habit = Habit.new
	end

	def create
		@habit = current_user.habits.build(habit_params)
		@habit[:active] = "true"
		
		if @habit.save
			redirect_to habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

	def week
		@habits = current_user.habits.where(active: "true") 

		if params[:year].nil? or params[:month].nil? or params[:day].nil?
			@checkinWeek = 	Date.current
		else
			begin
				@checkinWeek = Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
			rescue
				render :text => "week time is broken" and return
			end
		end

	end

	def stats
		@stats = current_user.habits.find(params[:habit_id])
	end

	private
		def habit_params
			params.require(:habit).permit(:name, :active)
		end
end