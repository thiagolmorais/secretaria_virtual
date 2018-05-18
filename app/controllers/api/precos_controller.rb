module Api
  class PrecosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      precos = Paciente.find(params[:paciente_id]).preco
      json = precos.as_json
      render json: { precos: json }
    end

    def create
      novo_preco_params = preco_params[:valor].tr(',', '.')
      @preco = Preco.new(preco_params)
      @preco.paciente_id = params[:paciente_id]
      @preco.valor = novo_preco_params
      if @preco.save
        render json: @preco, status: :created, location: "/api/pacientes/#{@preco}/precos"
      else
        render json: @preco.errors, status: :unprocessable_entity
      end
    end

    private

    def preco_params
      params.require(:preco).permit(:valor, :reajuste, :paciente_id)
    end
  end
end
