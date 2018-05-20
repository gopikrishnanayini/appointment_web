class HomesController < ApplicationController
		before_action :authenticate_user!
	def index
	end

	def new
    @appointment = Appointment.new
    @patient = Patient.new
    @doctor = Doctor.new
    @appointments = Appointment.all
	end

	def create
	  if params[:appointment].present?
	    @appointment = Appointment.create(appointment_params)
	    if @appointment.save
	      redirect_to new_home_path, :notice => "Appointment was created Successfully "
	    else
	      render :action => "new"
	    end
	  elsif params[:patient].present?
	    @patient = Patient.new(patient_params)
	    if @patient.save
	      redirect_to new_home_path, :notice => "Patient was created Successfully. "
	    else
	      render :action => "new"
	    end
	  elsif params[:doctor].present?
	    @doctor = Doctor.new(doctor_params)
	    if @doctor.save
	      redirect_to new_home_path, :notice => "Doctor was created Successfully. "
	    else
	      render :action => "new"
	    end
	  end 
  end 
  
  private
	def appointment_params
		params.require(:appointment).permit!
	end

  def patient_params
    params.require(:patient).permit!
  end

  def doctor_params
    params.require(:doctor).permit!
  end
end
