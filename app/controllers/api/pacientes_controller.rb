module Api
  class PacientesController < ApplicationController
    def index
      pacientes = Paciente.all
      json = pacientes.as_json
      render json: { pacientes: json }
    end

    def show
      paciente = Paciente.find(params[:id])
      json = paciente.as_json
      render json: { plans: json }, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum paciente encontrado' }, status: 404
    end

  end
end
