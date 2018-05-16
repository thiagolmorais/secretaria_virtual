module Api
  class ConsultasController < ApplicationController
    def index
      consultas = Consulta.all
      json = consultas.as_json
      render json: { consultas: json }
    end
  end
end
