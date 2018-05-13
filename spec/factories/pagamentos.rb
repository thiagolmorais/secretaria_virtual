FactoryBot.define do
  factory :pagamento do
    valor '9.99'
    data '2018-05-06'
    competencia 1
    paciente_id 1
    paciente nil
  end
end
