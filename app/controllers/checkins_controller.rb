class CheckinsController < ApplicationController
	def index
		if params.key? :status
			@checkin = Checkin.where(status: params[:status])
		elsif params.key? :date
			@checkin = Checkin.where(date: params[:date])
	#	elsif params.key? :date and :status
			#probably will have to do this at some point
		else #all checkins
			@checkin = Checkin.all
		end
	end

	def create
		time = Time.new
		@checkin = Checkin.new(checkin_params)
		@checkin.date = time.inspect

		if @checkin.save
			redirect_to habits_path
		else
			flash.now[:error] = habit.errors.messages.first.join(' ')
		end

	end

	private
		def checkin_params
			params.permit(:status, :habit_id)
		end
end
