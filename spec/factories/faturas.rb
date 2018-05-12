FactoryBot.define do
  factory :fatura do
    vencimento '2018-05-06'
    status false
    valor '9.99'
    competencia 1
    consulta_id 1
    consulta nil
  end
end
