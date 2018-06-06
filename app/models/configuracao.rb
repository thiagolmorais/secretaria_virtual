class Configuracao < ApplicationRecord
  def consulta_horas
    self.duracao_consulta * 3600
  end

  def meses_reajuste
    self.periodo_reajuste * 30
  end
end
