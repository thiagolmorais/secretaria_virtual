FactoryBot.define do
  factory :paciente do
    nome 'Paciente A'
    email 'paciente.a@email.com'
    telefone '999999999'
    sexo 'Feminino'
    nascimento '2000-01-01'
    paciente_desde '2017-01-18'
    status true
    dia_vencimento 15
    observacao 'Paciente de teste'
  end
end
