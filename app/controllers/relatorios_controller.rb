class RelatoriosController < ApplicationController
  before_action :authenticate_user!
  def index
    @faturas = Fatura.all
    @pacientes = Paciente.all
    @pagamentos = Pagamento.all
    @consultas = Consulta.all
    @competencias = competencias
    @valor_previsto = valor_previsto
    @valor_realizado = valor_realizado
  end

  private

  def competencias
    Consulta.select(:competencia).distinct
  end

  def valor_previsto
    Consulta.where(competencia: competencias).group(:competencia).sum(:valor)
  end

  def valor_realizado
    Pagamento.where(status: true, competencia: competencias).group(:competencia).sum(:valor)
  end
end
