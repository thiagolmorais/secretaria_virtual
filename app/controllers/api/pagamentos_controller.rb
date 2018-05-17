module Api
  class PagamentosController < ApplicationController
    def index
      pagamentos = Pagamento.all
      json = pagamentos.as_json
      render json: { pagamentos: json }
    end

    def show
      pagamento = Pagamento.find(params[:id])
      json = pagamento.as_json
      render json: { plans: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum pagamento encontrado' }, status: :not_found
    end
  end
end
