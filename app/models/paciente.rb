class Paciente < ApplicationRecord
  validates :nome, presence: true
  has_many :preco

  def actual_status
    status ? 'Ativo' : 'Inativo'
  end

end
