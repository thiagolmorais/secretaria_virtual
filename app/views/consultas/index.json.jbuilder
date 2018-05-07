json.array! @consultas.each do |consulta|
  json.set! :title, consulta.paciente.nome
  json.set! :start, consulta.data

end
