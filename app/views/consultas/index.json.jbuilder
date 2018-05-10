json.array! @consultas.each do |consulta|
  json.set! :title, consulta.paciente.nome
  json.set! :start, "#{consulta.data}T#{consulta.hora.strftime('%R')}"
fim = consulta.hora + 3600
  json.set! :end, "#{consulta.data}T#{fim.strftime('%R')}"
  json.edit_url edit_consulta_path(consulta.id)

end
