class CreatePrecos < ActiveRecord::Migration[5.1]
  def change
    create_table :precos do |t|
      t.decimal :valor
      t.date :reajuste
      t.integer :paciente_id
      t.references :paciente, foreign_key: true

      t.timestamps
    end
  end
end
