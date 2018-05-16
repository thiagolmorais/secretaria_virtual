FactoryBot.define do
  factory :fatura do
    vencimento '2018-05-06'
    status false
    valor '120,75'
    competencia 52_018
    consulta_id consulta
  end
end
