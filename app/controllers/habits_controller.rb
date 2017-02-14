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

		# @yesterday = @checkinDate - 1.day
		# @tomorrow = @checkinDate + 1.day
		#	@today = Date.current
		@next_week = @checkinDate + 7.days
		@last_week = @checkinDate - 7.days

		#@checkins = Habit.checkins_on(@checkinDate)

		@habits = current_user.habits.where(active: "true") #Habit.all.active #current_user.habits.where(...)
	end

	def today
#		@habits = current_user.habits.where(active: "true") #Habit.all.active #current_user.habits.where(...)
	end

	def new	
		@habit = Habit.new #current_user.habits.build #Habit.new #current_user.habits.build
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
		#@checkinWeek = Date.current 

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

#	def previousDay
#		Checkin.checkinDate -= 1.days
#		redirect_to today_habits_path

#		yesterday = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i) - 1.day

#		redirect_to get habits/index, :year => yesterday.year, :month => yesterday.month, :day => yesterday.day
#	end


	private
		def habit_params
			params.require(:habit).permit(:name, :active)
		end
end