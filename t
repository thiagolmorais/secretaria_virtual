
[1mFrom:[0m /home/thiagofernando/Fatec/secretaria_virtual/app/controllers/api/consultas_controller.rb @ line 19 Api::ConsultasController#create:

    [1;34m18[0m: [32mdef[0m [1;34mcreate[0m
 => [1;34m19[0m:   binding.pry
    [1;34m20[0m:   @configuracao = [1;34;4mConfiguracao[0m.last
    [1;34m21[0m:   @consulta = [1;34;4mConsulta[0m.new(consulta_params)
    [1;34m22[0m:   @consulta.competencia = [31m[1;31m"[0m[31m#{@consulta.data.year}[0m[31m#{@consulta.data.month}[0m[31m[1;31m"[0m[31m[0m [32mif[0m @consulta.data
    [1;34m23[0m:   @consulta.hora_final = @consulta.hora_inicial + @configuracao.consulta_horas
    [1;34m24[0m:   consulta_marcada = @consulta.horario_disponivel
    [1;34m25[0m:   [32mif[0m consulta_marcada.empty?
    [1;34m26[0m:     @consulta.valor = @consulta.valor_consulta.valor [32mif[0m @consulta.data
    [1;34m27[0m:     [32mif[0m @consulta.save
    [1;34m28[0m:       render [35mjson[0m: { [35mmessage[0m: [31m[1;31m'[0m[31mConsulta cadastrada com sucesso![1;31m'[0m[31m[0m }
    [1;34m29[0m:     [32melse[0m
    [1;34m30[0m:       @pacientes = [1;34;4mPaciente[0m.all
    [1;34m31[0m:       render [35mjson[0m: @consulta.errors, [35mstatus[0m: [33m:unprocessable_entity[0m
    [1;34m32[0m:     [32mend[0m
    [1;34m33[0m: 
    [1;34m34[0m:   [32melse[0m
    [1;34m35[0m:     @pacientes = [1;34;4mPaciente[0m.all
    [1;34m36[0m:     flash.now[[33m:notice[0m] = [31m[1;31m"[0m[31mJá há consulta marcada das #{consulta_marcada.first.hora_inicial.strftime([1;31m'[0m[31m%R[1;31m'[0m[31m[0m[31m)}[0m[31m as #{consulta_marcada.first.hora_final.strftime([1;31m'[0m[31m%R[1;31m'[0m[31m[0m[31m)}[0m[31m[1;31m"[0m[31m[0m
    [1;34m37[0m:     render [33m:new[0m
    [1;34m38[0m:   [32mend[0m
    [1;34m39[0m: [32mend[0m

