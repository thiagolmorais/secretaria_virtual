module Api
  class ConsultasController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      consultas = Consulta.all
      json = consultas.as_json
      render json: { consultas: json }
    end

    def show
      consulta = Consulta.find(params[:id])
      json = consulta.as_json
      render json: { consulta: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum consulta encontrado' }, status: :not_found
    end

    def create
      @consulta = Consulta.new(consulta_params)
      @consulta.competencia = "#{@consulta.data.month}#{@consulta.data.year}" if @consulta.data
      if @consulta.save
        render json: @consulta, status: :created, location: consulta_path(@consulta)
      else
        render json: @consulta.errors, status: :unprocessable_entity
      end
    end

    def update
      @pacientes = Paciente.all
      @consulta = Consulta.find(params[:id])
      if @consulta.update(consulta_params)
        render json: @consulta, status: :created, location: consulta_path(@consulta)
      else
        render json: @consulta.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @consulta = Consulta.find(params[:id])
      if @consulta.destroy
        render json: { message: 'Consulta excluida com sucesso!' }, status: :ok
      else
        render json: @consulta.errors, status: :unprocessable_entity
      end
    end

    private

    def consulta_params
      params.require(:consulta).permit(:data, :hora, :paciente_id)
    end
  end
end
