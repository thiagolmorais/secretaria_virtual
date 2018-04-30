class Preco < ApplicationRecord
  validates :valor, :reajuste, presence: true
  belongs_to :paciente

end
