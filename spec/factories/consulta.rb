FactoryBot.define do
  factory :consultum, class: 'Consulta' do
    data '2018-04-29'
    hora '2018-04-29 19:18:29'
    status false
    paciente_id 1
    paciente nil
  end
end
