class Consulta < ApplicationRecord
  validates :data, :hora, presence: true
  belongs_to :paciente

  def status_consulta
    status ? 'Atendido' : 'Agendado'
  end

  def atendimento(consulta)
    consulta.status = true
    consulta.save
    #redirect_to consultas_path
  end
end
