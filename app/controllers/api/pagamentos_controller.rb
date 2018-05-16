module Api
  class PagamentosController < ApplicationController
    def index
      pagamentos = Pagamento.all
      json = pagamentos.as_json
      render json: { pagamentos: json }
    end
  end
end
