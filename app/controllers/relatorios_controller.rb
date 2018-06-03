class RelatoriosController < ApplicationController
  before_action :authenticate_user!
  def index
    @faturas = Fatura.all
    @pacientes = Paciente.all
    @pagamentos = Pagamento.all
    @consultas = Consulta.all    
  end
end
