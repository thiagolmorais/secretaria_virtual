class PrecosController < ApplicationController
  before_action :authenticate_user!
  def new
    @preco = Preco.new
  end

  def create
    novo_preco_params = preco_params[:valor].tr(',', '.')
    @preco = Preco.new(preco_params)
    @preco.paciente_id = params[:paciente_id]
    @preco.valor = novo_preco_params
    if @preco.save
      redirect_to paciente_path(@preco.paciente_id)
    else
      render :new
    end
  end

  private

  def preco_params
    params.require(:preco).permit(:valor, :reajuste, :paciente_id)
  end
end
