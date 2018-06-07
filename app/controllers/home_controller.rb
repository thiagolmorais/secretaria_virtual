class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @hash_pagamento = pagamentos
    @pagamento_grafico = pagamentos.values
    @periodo_grafico = pagamentos.keys
    @pacientes = Paciente.all.order(:nome).paginate(page: params[:page], per_page: 5)
  end

  private

  def pagamentos
    Pagamento.where('competencia > ?', periodo).group(:competencia).sum(:valor)
  end

  def periodo
    data = 11.month.ago
    "#{data.year}#{data.month}"
  end
end
