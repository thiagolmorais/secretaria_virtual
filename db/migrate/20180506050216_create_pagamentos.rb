class CreatePagamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagamentos do |t|
      t.decimal :valor
      t.date :data
      t.integer :competencia
      t.integer :paciente_id
      t.references :paciente, foreign_key: true

      t.timestamps
    end
  end
end
