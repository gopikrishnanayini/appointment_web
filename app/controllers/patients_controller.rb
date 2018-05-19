class PatientsController < ApplicationController
	before_action :authenticate_user!
	def new
		@patient = Patient.new
	end

	def create
    @patient = Patient.new(patient_params)
    if @patient.save
   	  redirect_to homes_path, :notice => "Patient was created Successfully "
   	else
   		render :action => "new"
   	end
	end

  private
  
  def patient_params
    params.require(:patient).permit!
  end
end
