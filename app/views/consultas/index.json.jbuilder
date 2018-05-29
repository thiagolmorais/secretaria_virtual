json.array! @consultas.each do |consulta|
  json.set! :title, consulta.paciente.nome
  json.set! :start, "#{consulta.data}T#{consulta.hora_inicial.strftime('%R')}"
  json.set! :end, "#{consulta.data}T#{consulta.hora_final.strftime('%R')}"
  json.edit_url edit_consulta_path(consulta.id)
end
