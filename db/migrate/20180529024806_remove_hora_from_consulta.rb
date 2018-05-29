class RemoveHoraFromConsulta < ActiveRecord::Migration[5.1]
  def change
    remove_column :consulta, :hora, :time
  end
end
