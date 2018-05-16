module Api
  class FaturasController < ApplicationController
    def index
      faturas = Fatura.all
      json = faturas.as_json
      render json: { faturas: json }
    end
  end
end
