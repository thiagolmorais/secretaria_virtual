class FaturasController < ApplicationController
  before_action :authenticate_user!

  def index
    @pacientes = Paciente.search(params).order(:nome).paginate(page: params[:page], per_page: 10)
    @faturas = Fatura.all
  end

  def create
    @consulta = Consulta.find(params[:consulta_id])
    if @consulta.valor_consulta.nil?
      flash[:alert] = 'Não foi possível efetuar o atendimento, porque o paciente não possui preço cadastrado. Favor cadastrar um preço.'
      redirect_to new_paciente_preco_path(@consulta.paciente_id)
    else
      @fatura = Fatura.new(fatura_params)
      @fatura.valor = @consulta.valor
      @fatura.vencimento = Time.zone.now
      @consulta.status = true
      @fatura.save
      @consulta.save
      redirect_to consultas_agenda_path
    end
  end

  def destroy
    @fatura = Fatura.find(params[:id])
    @consulta = Consulta.find(@fatura.consulta_id)
    @consulta.status = false
    @consulta.save
    @fatura.destroy
    redirect_to consultas_agenda_path
  end

  private

  def fatura_params
    params.permit(:consulta_id, :competencia, :vencimento)
  end
end
