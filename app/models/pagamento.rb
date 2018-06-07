class Pagamento < ApplicationRecord
  belongs_to :paciente
end
def self.search(params)
  pagamentos = all
  pagamentos = Fatura.where(consulta_id: Consulta.where(paciente_id: Paciente.where("nome like ?", "%#{params[:search]}%"))).order(:nome) if params[:search]
  pagamentos
end
