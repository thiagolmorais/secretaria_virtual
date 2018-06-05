class Fatura < ApplicationRecord
  belongs_to :consulta
end
def self.search(params)
  faturas = all
  faturas = Fatura.joins(:consulta).joins(:paciente).where("pacientes.nome like ?", "%#{params[:search]}%").order(:nome) if params[:search]
  faturas
end
