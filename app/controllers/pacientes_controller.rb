class PacientesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pacientes = Paciente.all.order(:nome)
    @pacientes = Paciente.all.paginate(page: params[:page], per_page: 1)
  end

  def show
    @paciente = Paciente.find(params[:id])
    @preco = Preco.new
  end

  def new
    @paciente = Paciente.new
  end

  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      flash[:notice] = 'Paciente cadastrado com sucesso!'
      redirect_to @paciente
    else
      render :new
    end
  end

  def edit
    @paciente = Paciente.find(params[:id])
  end

  def update
    @paciente = Paciente.find(params[:id])
    if @paciente.update(paciente_params)
      flash[:notice] = 'Paciente editado com sucesso!'
      redirect_to @paciente
    else
      render :edit
    end
  end

  private

  def paciente_params
    params.require(:paciente).permit(:nome, :telefone, :observacao, :email,
                                     :nascimento, :sexo, :paciente_desde,
                                     :status, :dia_vencimento, :status)
  end
end
