module Api
  class ConsultasController < ApplicationController
    def index
      consultas = Consulta.all
      json = consultas.as_json
      render json: { consultas: json }
    end

    def show
      consulta = Consulta.find(params[:id])
      json = consulta.as_json
      render json: { plans: json }, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum consulta encontrado' }, status: 404
    end
  end
end
