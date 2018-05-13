# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'user@email.com', password: 123456)
paciente_a = Paciente.create(nome: 'Paciente A', telefone: '999999999',
                             observacao: 'Paciente blablabla',
                             email: 'paciente.a@email.com',
                             nascimento: '01/01/2000', sexo:'Feminino',
                             paciente_desde: '15/01/2017', dia_vencimento: 15)
paciente_b = Paciente.create(nome: 'Paciente B', telefone: '999999999',
                             observacao: 'Paciente blablabla',
                             email: 'paciente.b@email.com',
                             nascimento: '01/01/1980', sexo:'Masculino',
                             paciente_desde: '15/01/2017', dia_vencimento: 15)
consulta_1 = Consulta.create(data: '2018-04-09', hora: '2018-04-29 19:18:29',
                             status: true, paciente_id: paciente_a.id, competencia: 42018)
consulta_2 = Consulta.create(data: '2018-04-29', hora: '2018-04-29 20:18:29',
                             status: true, paciente_id: paciente_b.id, competencia: 42018)
consulta_3 = Consulta.create(data: '2018-04-30', hora: '2018-04-29 19:18:29',
                            status: false, paciente_id: paciente_a.id, competencia: 42018)
preco_1 = Preco.create(valor: '150.00', reajuste: '2018-04-01',
                       paciente_id: paciente_a.id)
preco_2 = Preco.create(valor: '180.00', reajuste: '2018-04-15',
                      paciente_id: paciente_a.id)
preco_3 = Preco.create(valor: '130.00', reajuste: '2018-05-01',
                       paciente_id: paciente_b.id)
fatura_paciente_a_consulta_1 = Fatura.create(vencimento: '2018-05-06',
                                             status: false,
                                             valor: preco_1.valor,
                                             competencia: 42018,
                                             consulta_id: consulta_1.id)
fatura_paciente_a_consulta_2 = Fatura.create(vencimento: '2018-05-06',
                                            status: false,
                                            valor: preco_3.valor,
                                            competencia: 42018,
                                            consulta_id: consulta_2 .id)
