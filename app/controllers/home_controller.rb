class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @pacientes = Paciente.all.order(:nome).paginate(page: params[:page], per_page: 5)
  end
end
