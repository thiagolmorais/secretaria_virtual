module Api
  class ConsultasController < ActionController::API
    def index
      consultas = Consulta.all
      json = consultas.as_json
      render json: { consultas: json }
    end

    def show
      consulta = Consulta.find(params[:id])
      json = consulta.as_json
      render json: { plans: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum consulta encontrado' }, status: :not_found
    end
  end
end
