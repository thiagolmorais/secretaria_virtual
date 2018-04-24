class CreateConsulta < ActiveRecord::Migration[5.1]
  def change
    create_table :consulta do |t|
      t.date :data
      t.date :hora
      t.integer :paciente_id
      t.references :paciente, foreign_key: true

      t.timestamps
    end
  end
end
