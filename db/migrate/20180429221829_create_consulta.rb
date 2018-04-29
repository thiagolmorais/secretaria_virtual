class CreateConsulta < ActiveRecord::Migration[5.1]
  def change
    create_table :consulta do |t|
      t.date :data
      t.time :hora
      t.boolean :status, default: false
      t.references :paciente, foreign_key: true

      t.timestamps
    end
  end
end
