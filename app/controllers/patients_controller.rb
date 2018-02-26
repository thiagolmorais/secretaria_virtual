class PatientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end
end
