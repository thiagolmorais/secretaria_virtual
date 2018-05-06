class CreateFaturas < ActiveRecord::Migration[5.1]
  def change
    create_table :faturas do |t|
      t.date :vencimento
      t.boolean :status, default: false
      t.decimal :valor
      t.integer :competencia
      t.integer :consulta_id
      t.references :consulta, foreign_key: true

      t.timestamps
    end
  end
end
