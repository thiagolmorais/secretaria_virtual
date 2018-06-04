class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @pacientes = Paciente.all.order(:nome)
    @pagamento_grafico = pagamentos.values
    @periodo_grafico = pagamentos.keys
  end

  private

  def pagamentos
    valores = Pagamento.where('competencia > ?', periodo).group(:competencia).sum(:valor)
  end

  def periodo
    "#{Time.zone.now.year-1}#{Time.zone.now.month+1}"
  end
end
