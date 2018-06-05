class Pagamento < ApplicationRecord
  belongs_to :paciente
end
def self.search(params)
  pagamentos = all
  pagamentos = Fatura.joins(:consulta).joins(:paciente).where("pacientes.nome like ?", "%#{params[:search]}%").order(:nome) if params[:search]
  pagamentos
end
