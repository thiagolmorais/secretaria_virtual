class FaturasController < ApplicationController
  before_action :authenticate_user!

  def index
    @pacientes = Paciente.all
    @faturas = Fatura.all
  end
<<<<<<< c8147b88821393b0e3cfd5166137c67ef31117c9
=======

  def show
    @faturas = Fatura.find(params[:id])
  end

  def create
    @fatura = Fatura.new(fatura_params)
    @consulta = Consulta.find(params[:consulta_id])
    @fatura.valor = @consulta.valor_consulta.valor
    @fatura.vencimento = @fatura.competencia
    @consulta.status = true
    @fatura.save
    @consulta.save
    redirect_to consultas_path
  end

  def destroy
    @fatura = Fatura.find(params[:id])
    @consulta = Consulta.find(@fatura.consulta_id)
    @consulta.status = false
    @consulta.save
    @fatura.destroy
    redirect_to consultas_path
  end

  private

  def fatura_params
    params.permit(:consulta_id, :competencia)
  end
>>>>>>> Fix paciente
end
