class Consulta < ApplicationRecord
  validates :data, :hora, presence: true
  belongs_to :paciente

  def status_consulta
    status ? 'Atendido' : 'Agendado'
  end

  def atendimento(consulta)
    if status == false
      consulta.status = true
      #consulta.gera_fatura
    else
      consulta.status = false
    end
    consulta.save
  end

  def gera_fatura
    @fatura = Fatura.new(consulta_id: self.id, valor: valor_consulta, status: true, competencia: self.data, vencimento: self.data)
    @fatura.save
  end

  def valor_consulta
    self.paciente.preco_vigente
  end
end
