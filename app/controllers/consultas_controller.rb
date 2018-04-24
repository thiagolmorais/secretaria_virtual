class ConsultasController < ApplicationController
  before_action :authenticate_user!
  def index
    @consultas = Consulta.all
  end

  def show
    @pacientes = Paciente.all
    @consulta = Consulta.find(params[:id])
  end

  def new
    @pacientes = Paciente.all
    @consulta = Consulta.new
  end

  def create
    @consulta = Consulta.new(consulta_params)
    if @consulta.save
      redirect_to consultas_path
    else
      render :new
    end
  end

  def edit
    @pacientes = Paciente.all
    @consulta = Consulta.find(params[:id])
  end

  def update
    @consulta = Consulta.find(params[:id])
    if @consulta.update(consulta_params)
      redirect_to consultas_path
    else
      render :edit
    end
  end

  private

  def consulta_params
    params.require(:consulta).permit(:data, :hora, :paciente_id)
  end
end
