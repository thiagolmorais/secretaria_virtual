class AddHoraFromConsulta < ActiveRecord::Migration[5.1]
  def change
    add_column :consulta, :hora_inicial, :time
    add_column :consulta, :hora_final, :time
  end
end
