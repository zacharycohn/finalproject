class CheckinsController < ApplicationController
<<<<<<< HEAD
	#ToDO: figure out how to uncomment this when next/previousWeek links are pressed.
#	before_filter :find_habit
=======
	#before_filter :find_habit
>>>>>>> tempbranch

	def index
		find_habit
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
		find_habit

		@checkin = @habit.checkins.build(status: checkin_params)
<<<<<<< HEAD
		
		#refactor
		#time = Time.now
		#checkinDate = time.strftime("%B %d %Y")
		#@checkin.date = checkinDate

		#ToDO: probably change pants party
=======
		time = Time.now
		checkinDate = time.strftime("%Y-%m-%d")
		@checkin.date = checkinDate
>>>>>>> tempbranch
		@checkin.description = "pants party"

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

<<<<<<< HEAD
		#refactor
#		time = Time.now
#		checkinDate = time.strftime("%B %d %Y")
#		@checkin.date = checkinDate
=======
		time = Time.now
		checkinDate = time.strftime("%Y-%m-%d")
		@checkin.date = checkinDate
>>>>>>> tempbranch
		@checkin.description = "pants party"
		
		if @checkin.update(status: checkin_params)
			flash[:notice] = @checkin.status
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

<<<<<<< HEAD
	#refactor maybe
=======
>>>>>>> tempbranch
	def previousWeek
		Checkin.startDay += 7
		Checkin.endDay += 7

		redirect_to week_habits_path
	end

<<<<<<< HEAD
	#refactor maybe
=======
>>>>>>> tempbranch
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
