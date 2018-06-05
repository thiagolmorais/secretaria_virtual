module Api
  class FaturasController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      faturas = Fatura.all
      json = faturas.as_json
      render json: { faturas: json }
      respond_to do |format|
    format.json { render json: faturas }
  end
    end

    def show
      fatura = Fatura.find(params[:id])
      json = fatura.as_json
      render json: { fatura: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum fatura encontrado' }, status: :not_found
    end

    def create
      @consulta = Consulta.find(params[:fatura][:consulta_id])
      if @consulta.valor_consulta.nil?
        render json: @fatura.errors, status: :unprocessable_entity
      else
        @fatura = Fatura.new(fatura_params)
        @fatura.valor = @consulta.valor_consulta.valor
        @fatura.vencimento = Time.zone.now
        @consulta.status = true
        @fatura.save
        @consulta.save
        render json: @fatura, status: :created, location: @fatura
      end
    end

    def destroy
      @fatura = Fatura.find(params[:id])
      @consulta = Consulta.find(@fatura.consulta_id)
      @consulta.status = false
      @consulta.save
      if @fatura.destroy
        render json: { message: 'Fatura excluida com sucesso!' }, status: :ok
      else
        render json: @fatura.errors, status: :unprocessable_entity
      end
    end

    private

    def fatura_params
      params.require(:fatura).permit(:consulta_id, :competencia, :vencimento)
    end
  end
end
