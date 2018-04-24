class Paciente < ApplicationRecord
  validates :nome, presence: true
  has_many :preco, dependent: :destroy
  has_many :consulta, dependent: :destroy

  def actual_status
    status ? 'Ativo' : 'Inativo'
  end

  def ultimo_preco
    preco << Preco.where(paciente_id: @paciente)
  end
end
