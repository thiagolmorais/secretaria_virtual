class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    binding.pry
    @pacientes = Paciente.all.order(:nome)
    @pagamento_grafico = pagamentos.values
    @periodo_grafico = pagamentos.keys
    @pacientes = Paciente.all.order(:nome).paginate(page: params[:page], per_page: 5)
  end

  private

  def pagamentos
    Pagamento.where('competencia > ?', periodo).group(:competencia).sum(:valor)
  end

  def periodo
    "#{Time.zone.now.year-1}#{Time.zone.now.month+1}"

  end
end
