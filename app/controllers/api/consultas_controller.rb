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
      @configuracao = Configuracao.last
      @consulta = Consulta.new(consulta_params)
      @consulta.competencia = "#{@consulta.data.year}#{@consulta.data.month}" if @consulta.data
      @consulta.hora_final = @consulta.hora_inicial + @configuracao.consulta_horas
      consulta_marcada = @consulta.horario_disponivel
      if consulta_marcada.empty?
        @consulta.valor = @consulta.valor_consulta.valor if @consulta.data
        if @consulta.save
          render json: { message: 'Consulta cadastrada com sucesso!' }
        else
          @pacientes = Paciente.all
          render json: @consulta.errors, status: :unprocessable_entity
        end

      else
        @pacientes = Paciente.all
        render json: { message: "Já há consulta marcada das #{consulta_marcada.first.hora_inicial.strftime('%R')} as #{consulta_marcada.first.hora_final.strftime('%R')}" }
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
      params.require(:consulta).permit(:data, :hora_inicial, :hora_final, :paciente_id)
    end
  end
end
