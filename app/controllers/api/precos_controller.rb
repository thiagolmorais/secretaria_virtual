module Api
  class PrecosController < ApplicationController
    def index
      precos = Preco.all
      json = precos.as_json
      render json: { precos: json }
    end
  end
end
