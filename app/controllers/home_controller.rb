class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @pacientes = Paciente.all.order(:nome)
  end
end
