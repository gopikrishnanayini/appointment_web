class AppointmentsController < ApplicationController
	before_action :authenticate_user!

	def index
      @appointments = Appointment.all
	end

	def new
      @appointment = Appointment.new
	end

	def create
    @appointment = Appointment.create
    if @appointment.save
      redirect_to appointments_path, :notice => "Appointment was created Successfully "
    else
      render :action => "new"
    end
	end

	private
	def appointment_params
		params.require(:appointment).permit!
	end
end
