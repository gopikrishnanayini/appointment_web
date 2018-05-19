class DoctorsController < ApplicationController
	before_action :authenticate_user!

	def new
       @doctor = Doctor.new
	end

	def create
		@doctor = Doctor.new(doctor_params)
		if @doctor.save
			redirect_to homes_path, :notice => "Doctor was created Successfully "
		else
			render :action => "new"
		end
	end

	private

	def doctor_params
		params.require(:doctor).permit!
	end
end
