class Paciente < ApplicationRecord
  validates :nome, :nascimento, :paciente_desde, :dia_vencimento, presence: true
  has_many :preco, dependent: :delete_all
  has_many :consulta, dependent: :delete_all

  def status_paciente
    status ? 'Ativo' : 'Inativo'
  end

  def ultimo_preco
    preco << Preco.where(paciente_id: @paciente)
  end

  def preco_vigente
    preco_valido = []
    precos = self.preco.order(:reajuste)
    precos.each do |preco|
      preco_valido << preco if preco.reajuste < Time.now
    end
    preco_valido.last.valor
  end
end
