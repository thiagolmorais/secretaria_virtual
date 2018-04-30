FactoryBot.define do
  factory :fatura do
    vencimento "2018-04-30"
    status false
    consulta_id 1
    valor "9.99"
    competencia "2018-04-30"
    consulta nil
  end
end
