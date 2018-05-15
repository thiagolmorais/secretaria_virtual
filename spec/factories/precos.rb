FactoryBot.define do
  factory :preco do
    valor '120.75'
    reajuste '2018-04-22'
    paciente_id paciente
  end
end
