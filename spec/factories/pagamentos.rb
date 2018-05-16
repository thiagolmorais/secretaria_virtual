FactoryBot.define do
  factory :pagamento do
    valor '120,75'
    data '2018-05-06'
    competencia 52_018
    paciente_id paciente
  end
end
