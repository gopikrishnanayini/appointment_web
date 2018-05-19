class DoctorsController < ApplicationController
	
	before_action :authenticate_user!
  before_action :find_doctor, :only => [:show, :edit, :update, :destroy]
  
  def index
    @doctors = Doctor.all
  end

	def new
    @doctor = Doctor.new
	end

	def create
		@doctor = Doctor.new(doctor_params)
		if @doctor.save
			redirect_to doctors_path, :notice => "Doctor was created Successfully. "
		else
			render :action => "new"
		end
	end
  
  def show
  end

  def edit
  end

  def update
    if @doctor.update_attributes(doctor_params)
    	redirect_to doctors_path, :notice => "Doctor was updated Successfully. "
    else
    	render :action => "edit"
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

	private

	def find_doctor
		@doctor = Doctor.find(params[:id])
	end

	def doctor_params
		params.require(:doctor).permit!
	end
end
