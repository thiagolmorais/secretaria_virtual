class ConsultasController < ApplicationController
  before_action :authenticate_user!
  def index
    @consultas = Consulta.all.order(:data)
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
    @consulta.competencia = "#{@consulta.data.month}#{@consulta.data.year}" if @consulta.data
    if @consulta.save
      flash[:notice] = 'Consulta cadastrada com sucesso!'
      redirect_to consulta_path(@consulta)
    else
      @pacientes = Paciente.all
      render :new
    end
  end

  def edit
    @pacientes = Paciente.all
    @consulta = Consulta.find(params[:id])
  end

  def update
    @pacientes = Paciente.all
    @consulta = Consulta.find(params[:id])
    if @consulta.update(consulta_params)
      flash[:notice] = 'Consulta editada com sucesso!'
      redirect_to consulta_path(@consulta)
    else
      @pacientes = Paciente.all
      render :edit
    end
  end

  def destroy
    @consulta = Consulta.find(params[:id])
    @consulta.destroy
    flash[:sucess] = 'Consulta excluída com sucesso!'
    redirect_to consultas_path
  end

  private

  def consulta_params
    params.require(:consulta).permit(:data, :hora, :paciente_id)
  end
end
