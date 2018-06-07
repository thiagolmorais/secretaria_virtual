class Fatura < ApplicationRecord
  belongs_to :consulta
end
def self.search(params)
  faturas = all
  faturas = Fatura.where(consulta_id: Consulta.where(paciente_id: Paciente.where("nome like ?", "%#{params[:search]}%").order(:nome) if params[:search]
  faturas
end
