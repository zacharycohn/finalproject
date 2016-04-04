class CheckinsController < ApplicationController
	#ToDO: figure out how to uncomment this when next/previousWeek links are pressed.
#	before_filter :find_habit

	def index
		if params.key? :status
			@checkin = Checkin.where(status: params[:status])
			#refactor
#		elsif params.key? :date
#			@checkin = Checkin.where(date: params[:date])
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
		@checkin = @habit.checkins.build(status: checkin_params)
		
		#refactor
		#time = Time.now
		#checkinDate = time.strftime("%B %d %Y")
		#@checkin.date = checkinDate

		#ToDO: probably change pants party
		@checkin.description = "pants party"

		if @checkin.save
			flash[:notice] = @checkin.status
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end

	end

	def update
		@checkin = @habit.checkins.find(params[:id])

		#refactor
#		time = Time.now
#		checkinDate = time.strftime("%B %d %Y")
#		@checkin.date = checkinDate
		@checkin.description = "pants party"
		
		if @checkin.update(status: checkin_params)
			flash[:notice] = @checkin.status
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

	#refactor maybe
	def previousWeek
		Checkin.startDay += 7
		Checkin.endDay += 7

		redirect_to week_habits_path
	end

	#refactor maybe
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
