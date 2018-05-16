module Api
  class PrecosController < ApplicationController
    def index
      precos = Preco.all
      json = precos.as_json
      render json: { precos: json }
    end

    def show
      preco = Preco.find(params[:id])
      json = preco.as_json
      render json: { plans: json }, status: 200
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum preço encontrado' }, status: 404
    end
  end
end
