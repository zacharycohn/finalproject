class CheckinsController < ApplicationController
	#before_filter :find_habit

	def index
		find_habit
		if params.key? :status
			@checkin = Checkin.where(status: params[:status])
		elsif params.key? :date
			@checkin = Checkin.where(date: params[:date])
	#	elsif params.key? :date and :status
			#probably will have to do this at some point
		else #all checkins
			@checkin = @habit.checkins
		end

	end

	def new
		@checkin = @habit.checkins.build
	end

	def create
		find_habit

		@checkin = @habit.checkins.build(status: checkin_params)
		@checkin.date = params[:date]
		@checkin.description = "new"

		if @checkin.save
			flash[:notice] = @checkin.status
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end

	end

	def update
		find_habit

		@checkin = @habit.checkins.find(params[:id])

		@checkin.date = params[:date]
		@checkin.description = "update"

		if @checkin.update(status: checkin_params)
			flash[:notice] = @checkin.status
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

	def nextDay
		if Checkin.checkinDay > 0 
			Checkin.checkinDay -= 1
		end

		redirect_to today_habits_path
	end

	def previousDay
		Checkin.checkinDay += 1

		redirect_to today_habits_path
	end

	def jumpToToday
		Checkin.checkinDay = 0
		redirect_to today_habits_path
	end

	def previousWeek
		Checkin.startDay += 7
		Checkin.endDay += 7

		redirect_to week_habits_path
	end

	def jumpToThisWeek
		Checkin.startDay = 6
		Checkin.endDay = 0

		redirect_to week_habits_path
	end

	def nextWeek
		if Checkin.endDay >= 7
			Checkin.startDay -= 7
			Checkin.endDay -= 7
		end
		
		redirect_to week_habits_path
	end


private
	def checkin_params
		params.require(:status)
	end

	def find_habit
		@habit = Habit.find(params[:habit_id])
	end
end
