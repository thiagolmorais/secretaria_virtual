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
    precos = preco.order(:reajuste)
    precos.each do |preco|
      preco_valido << preco if preco.reajuste < Time.zone.now
    end
    preco_valido.last
  end

  def competencias
    Fatura.select(:competencia).where(consulta_id: Consulta.where(paciente_id: self)).distinct
  end
end
