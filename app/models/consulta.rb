class Consulta < ApplicationRecord
  validates :data, :hora, presence: true
  belongs_to :paciente
end
