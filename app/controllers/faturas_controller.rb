class FaturasController < ApplicationController
  before_action :authenticate_user!

  def index
    @pacientes = Paciente.all
    @faturas = Fatura.all
  end
end
