date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id consulta.id
json.title consulta.title
json.start consulta.start.strftime(date_format)
json.end consulta.end.strftime(date_format)

json.color consulta.color if consulta.color.present?
json.allDay event.all_day_event? ? true : false

json.update_url consulta_path(consulta, method: :patch)
json.edit_url edit_consulta_path(consulta)
