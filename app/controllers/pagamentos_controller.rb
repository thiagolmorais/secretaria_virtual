class PagamentosController < ApplicationController
  before_action :authenticate_user!
  def index
    @faturas = Fatura.all
    @pacientes = Paciente.all
  end

  def create
    @pagamento = Pagamento.new(pagamento_params)
    @pagamento.data = Time.now
    @pagamento.save
    @faturas = Fatura.where(competencia: @pagamento.competencia, consulta_id: Consulta.where(paciente_id: @pagamento.paciente_id))
    @faturas.update(status: true)
    @faturas = Fatura.all
    @pacientes = Paciente.all
    render :index
  end

  def destroy
    @pagamentos = Pagamento.find(params[:id])
    @faturas = Fatura.where(competencia: @pagamentos.competencia, consulta_id: Consulta.where(paciente_id: @pagamentos.paciente_id))
    @faturas.update(status: false)
    @pagamentos.destroy
    @faturas = Fatura.all
    @pacientes = Paciente.all
    render :index
  end

  private

  def pagamento_params
    params.permit(:paciente_id, :competencia, :valor)
  end
end
