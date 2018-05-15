FactoryBot.define do
  factory :consulta, class: 'Consulta' do
    data '2018-04-29'
    hora '2018-04-29 19:18:29'
    status false
    paciente_id paciente
  end
end
