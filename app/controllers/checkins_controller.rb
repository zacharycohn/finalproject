class CheckinsController < ApplicationController
	before_filter :find_habit
	attr_accessor :startDay, :endDay

	def index
		@startDay = 6
		@endDay = 0

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
		# form_for [@habit, @checkin] do |f| 
	end

	def create
		@checkin = @habit.checkins.build(status: checkin_params)
		time = Time.now
		checkinDate = time.strftime("%B %d %Y")
		@checkin.date = checkinDate
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

		time = Time.now
		checkinDate = time.strftime("%B %d %Y")
		@checkin.date = checkinDate
		@checkin.description = "pants party"
		
		if @checkin.update(status: checkin_params)
			flash[:notice] = @checkin.status
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end
	end


private
	def checkin_params
		params.require(:status)
	end

	def find_habit
		@habit = Habit.find(params[:habit_id])
	end
end
