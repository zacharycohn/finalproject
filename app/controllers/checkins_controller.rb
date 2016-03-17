class CheckinsController < ApplicationController
	before_filter :find_habit

	def index
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
		time = Time.new
		@checkin = @habit.checkins.build(status: params[:status])
		@checkin.date = time.inspect

		if @checkin.save
			redirect_to today_habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end

	end

	private
	def checkin_params
		params.require(:checkin).permit(:status, :habit_id)
	end

	def find_habit
		@habit = Habit.find(params[:habit_id])
	end
end
