module Api
  class PacientesController < ApplicationController
    def index
      pacientes = Paciente.all
      json = pacientes.as_json
      render json: { pacientes: json }
    end
  end
end
