class Paciente < ApplicationRecord
  validates :nome, :nascimento, :paciente_desde, presence: true
  has_many :preco, dependent: :delete_all
  has_many :consulta, dependent: :delete_all

  def actual_status
    status ? 'Ativo' : 'Inativo'
  end

  def ultimo_preco
    preco << Preco.where(paciente_id: @paciente)
  end
end
