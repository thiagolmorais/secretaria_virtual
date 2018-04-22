class PrecosController < ApplicationController
  before_action :authenticate_user!
  def new
    @preco = Preco.new
  end

  def create
    binding.pry
    @preco = Preco.new(preco_params)
    @preco.paciente_id = params[:paciente_id]

    if @preco.save
      redirect_to pacientes_path
    else
      render :new
    end
  end

  private

  def preco_params
    params.require(:preco).permit(:valor, :reajuste, :paciente_id)
  end
end
