class CheckinsController < ApplicationController

	def index

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

			redirect_to("/habits/#{@checkin.date.year}/#{@checkin.date.month}/#{@checkin.date.day}")
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

			redirect_to("/habits/#{@checkin.date.year}/#{@checkin.date.month}/#{@checkin.date.day}")
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
