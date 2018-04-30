class CreateFaturas < ActiveRecord::Migration[5.1]
  def change
    create_table :faturas do |t|
      t.date :vencimento
      t.boolean :status, default: false
      t.integer :consulta_id
      t.decimal :valor
      t.date :competencia
      t.references :consulta, foreign_key: true

      t.timestamps
    end
  end
end
