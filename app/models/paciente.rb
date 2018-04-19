class Paciente < ApplicationRecord
  validates :nome, presence: true
end
