class Consulta < ApplicationRecord
  validates :data, :hora, presence: true
  belongs_to :paciente

  def status_consulta
    status ? 'Atendido' : 'Agendado'
  end

  def gera_fatura
    fatura = Fatura.create(consulta_id: self.id, valor: valor_consulta.valor, status: true, competencia: self.data, vencimento: self.data)
  end

  def valor_consulta
    preco_valido = []
    precos = Preco.where(paciente_id: self.paciente_id).order(:reajuste)
    precos.each do |preco|
      preco_valido << preco if preco.reajuste < self.data
    end
    preco_valido.last
  end
end
