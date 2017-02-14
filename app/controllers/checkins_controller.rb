class CheckinsController < ApplicationController

	def index
		# find_habit
		# if params.key? :status
		# 	@checkin = Checkin.where(status: params[:status])
		# elsif params.key? :date
		# 	@checkin = Checkin.where(date: params[:date])
		# else #all checkins
		# 	@checkin = @habit.checkins
		# end

	end

	def new
		@checkin = @habit.checkins.build
	end

#covered by tests
	def create
		find_habit

		@checkin = @habit.checkins.build(status: checkin_params)
		@checkin.date = params[:date]
		@checkin.description = "new"

		if @checkin.save
			flash[:notice] = @checkin.status
			#			redirect_to habits_path

			redirect_to habits_path #, :year => @checkinDate.year, :month => @checkinDate.month, :day => @checkinDate.day
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end

	end

	def update
		find_habit

		@checkin = @habit.checkins.find(params[:id])
		@checkin.date = params[:date]
		@checkin.description = "updated"

		if @checkin.update(status: checkin_params)
			flash[:notice] = @checkin.status
			#			redirect_to habits_path

			redirect_to habits_path #, :year => @checkin.date.year, :month => @checkinDate.month, :day => @checkinDate.day
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end

#move to habit controller
	# def nextDay
	# 	if Checkin.checkinDate.strftime("%Y-%m-%d") < Time.now.strftime("%Y-%m-%d")
	# 		Checkin.checkinDate += 1.days
	# 	end

	# 	redirect_to today_habits_path
	# end

#move to habit controller
# 	def previousDay
# #		Checkin.checkinDate -= 1.days
# #		redirect_to today_habits_path

# 		yesterday = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i) - 1.day

# 		redirect_to get habits/index, :year => yesterday.year, :month => yesterday.month, :day => yesterday.day
# 	end

	# def jumpToToday
	# 	Checkin.checkinDate = Time.now

	# 	redirect_to today_habits_path
	# end


###########
	# def previousWeek
	# 	Checkin.checkinDate -= 7.days

	# 	redirect_to week_habits_path
	# end

	# def jumpToThisWeek
	# 	Checkin.checkinDate = Time.now
		
	# 	redirect_to week_habits_path
	# end

	# def nextWeek
	# 	if Checkin.checkinDate.strftime("%Y-%m-%d") < Time.now.strftime("%Y-%m-%d")
	# 		Checkin.checkinDate += 7.days
	# 	end
		
	# 	redirect_to week_habits_path
	# end

private
	def checkin_params
		params.require(:status)
	end

	def find_habit
		@habit = Habit.find(params[:habit_id])
	end

end
