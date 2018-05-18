module Api
  class PacientesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      pacientes = Paciente.all
      json = pacientes.as_json
      render json: { pacientes: json }
    end

    def show
      paciente = Paciente.find(params[:id])
      json = paciente.as_json
      render json: { paciente: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum paciente encontrado' }, status: :not_found
    end

    def create
      @paciente = Paciente.new(paciente_params)
      if @paciente.save
        render json: @paciente, status: :created, location: @paciente
      else
        render json: @paciente.errors, status: :unprocessable_entity
      end
    end

    def update
      @paciente = Paciente.find(params[:id])
      if @paciente.update(paciente_params)
        render json: @paciente, status: :created, location: @paciente
      else
        render json: @paciente.errors, status: :unprocessable_entity
      end
    end

    private
    def paciente_params
      params.require(:paciente).permit(:nome, :telefone, :observacao, :email,
                                       :nascimento, :sexo, :paciente_desde,
                                       :paciente_desde, :paciente_desde,
                                       :dia_vencimento)
    end
  end
end
