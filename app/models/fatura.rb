class Fatura < ApplicationRecord
  belongs_to :consulta

  def status_fatura
    status ? 'Quitada' : 'Em aberto'
  end
end
