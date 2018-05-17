module Api
  class FaturasController < ApplicationController
    def index
      faturas = Fatura.all
      json = faturas.as_json
      render json: { faturas: json }
    end

    def show
      fatura = Fatura.find(params[:id])
      json = fatura.as_json
      render json: { plans: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum fatura encontrado' }, status: :not_found
    end
  end
end
