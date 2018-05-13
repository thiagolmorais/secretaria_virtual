class AddCompetenciaToConsultas < ActiveRecord::Migration[5.1]
  def change
    add_column :consulta, :competencia, :integer
  end
end
