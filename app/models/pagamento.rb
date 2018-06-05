class Pagamento < ApplicationRecord
  belongs_to :paciente
end
def self.search(params)
  pagamentos = all
  pagamentos = Fatura.joins(:consulta).joins(:paciente).where("pacientes.nome.downcase like ?", "%#{params[:search].downcase}%").order(:nome) if params[:search]
  pagamentos
end
