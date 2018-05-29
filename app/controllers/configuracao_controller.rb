class ConfiguracaoController < ApplicationController
  before_action :authenticate_user!
  def index
    @configuracao = Configuracao.new
    @configuracao_last = Configuracao.last
  end

  def update
    @configuracao = Configuracao.find(params[:id])
    if @configuracao.update(configuracao_params)
      flash[:notice] = 'Configuracao editada com sucesso!'
      redirect_to configuracao_index_path
    else
      render :index
    end
  end

  private

  def configuracao_params
    params.require(:configuracao).permit(:duracao_consulta, :periodo_reajuste)
  end
end
