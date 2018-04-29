class Consulta < ApplicationRecord
  validates :data, :hora, presence: true
  belongs_to :paciente

  def status_consulta
    status ? 'Atendido' : 'Agendado'
  end
end
