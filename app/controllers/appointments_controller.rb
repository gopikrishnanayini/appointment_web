class AppointmentsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_appointment, :only => [:show, :update, :edit, :destroy]
  
	def index
    @appointments = Appointment.all
  end
    

  def new
    @appointment = Appointment.new
	end

	def create
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      redirect_to appointments_path, :notice => "Appointment was created Successfully "
    else
      render :action => "new"
    end  
	end

  def show
  end

  def edit
  end

  def update
  	if @appointment.update(appointment_params)
  		redirect_to appointments_path, :notice => "Appointment was updated Successfully "
  	else
  		render :action => "edit"
  	end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

	private
	def find_appointment
      @appointment = Appointment.find(params[:id])
	end

	def appointment_params
		params.require(:appointment).permit!
	end
end
