class Consulta < ApplicationRecord
  validates :data, :hora_inicial, :hora_final, presence: true
  belongs_to :paciente

  def status_consulta
    status ? 'Atendido' : 'Agendado'
  end
  def self.search(params)
      consultas = all
      consultas = Consulta.joins(:paciente).where("pacientes.nome like ?", "%#{params[:search]}%").order(:data) if params[:search]
      consultas
    end
  def gera_fatura
    Fatura.create(consulta_id: id, valor: valor_consulta.valor, status: true,
                  competencia: data, vencimento: data)
  end

  def valor_consulta
    preco_valido = []
    precos = Preco.where(paciente_id: paciente_id).order(:reajuste)
    precos.each do |preco|
      preco_valido << preco if preco.reajuste < data
    end
    preco_valido.last
  end

  def horario_disponivel
    Consulta.where("hora_inicial <= ? AND hora_final >= ? AND data = ?", self.hora_final, self.hora_inicial, self.data)
  end
end
