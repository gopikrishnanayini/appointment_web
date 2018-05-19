class PatientsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_patient, :only => [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

	def new
		@patient = Patient.new
	end

	def create
    @patient = Patient.new(patient_params)
    if @patient.save
   	  redirect_to homes_path, :notice => "Patient was created Successfully. "
   	else
   		render :action => "new"
   	end
	end

  def show
  end

  def edit
  end
  
  def update
    if @patient.update_attributes(patient_params)
      redirect_to patients_pat, :notice => "Patient was updated Successfully."
    else
      render :action => "edit"
    end
  end

  private

  def find_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit!
  end
end
