class ConsultasController < ApplicationController
  before_action :authenticate_user!
  def index
    @consultas = Consulta.order(:data).order(:hora_inicial)
  end

  def show
    @pacientes = Paciente.all
    @consulta = Consulta.find(params[:id])
  end

  def agenda
    @consultas = Consulta.search(params).order(:data).order(:hora_inicial).paginate(page: params[:page], per_page: 10)
  end

  def new
    @pacientes = Paciente.all
    @consulta = Consulta.new
  end

  def create
    @configuracao = Configuracao.last
    @consulta = Consulta.new(consulta_params)
    @consulta.competencia = "#{@consulta.data.year}#{@consulta.data.month}" if @consulta.data
    @consulta.hora_final = @consulta.hora_inicial + @configuracao.consulta_horas
    consulta_marcada = @consulta.horario_disponivel
    if consulta_marcada.empty?
      @consulta.valor = @consulta.valor_consulta.valor if @consulta.data
      if @consulta.save
        flash[:notice] = 'Consulta cadastrada com sucesso!'
        redirect_to consultas_path
      else
        @pacientes = Paciente.all
        render :new
      end

    else
      @pacientes = Paciente.all
      flash.now[:notice] = "Já há consulta marcada das #{consulta_marcada.first.hora_inicial.strftime('%R')} as #{consulta_marcada.first.hora_final.strftime('%R')}"
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
      redirect_to consultas_agenda_path
    else
      @pacientes = Paciente.all
      render :edit
    end
  end

  def destroy
    @consulta = Consulta.find(params[:id])
    @consulta.destroy
    flash[:sucess] = 'Consulta excluída com sucesso!'
    redirect_to consultas_agenda_path
  end

  private

  def consulta_params
    params.require(:consulta).permit(:data, :hora_inicial, :hora_final, :paciente_id)
  end
end
