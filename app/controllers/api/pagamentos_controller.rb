module Api
  class PagamentosController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      pagamentos = Pagamento.all
      json = pagamentos.as_json
      render json: { pagamentos: json }
    end

    def show
      pagamento = Pagamento.find(params[:id])
      json = pagamento.as_json
      render json: { pagamento: json }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Nenhum pagamento encontrado' }, status: :not_found
    end

    def create
      @pagamento = Pagamento.new(pagamento_params)
      @pagamento.data = Time.zone.now
      @pagamento.status = true
      @faturas = Fatura.where(competencia: @pagamento.competencia,
                              consulta_id: Consulta.where(paciente_id: @pagamento.paciente_id))
      if @pagamento.save
        @faturas.update(status: true)
        render json: @pagamento, status: :created, location: @pagamento
      else
        render json: @pagamento.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @pagamentos = Pagamento.find(params[:pagamento][:id])
      @faturas = Fatura.where(competencia: @pagamentos.competencia,
                              consulta_id: Consulta.where(paciente_id: @pagamentos.paciente_id))
      if @pagamentos.destroy
        @faturas.update(status: false)
        render json: { message: 'Pagamento estornado com sucesso!' }, status: :ok
      else
        render json: @pagamentos.errors, status: :unprocessable_entity
      end
    end

    private

    def pagamento_params
      params.require(:pagamento).permit(:paciente_id, :competencia, :valor)
    end
  end
end
