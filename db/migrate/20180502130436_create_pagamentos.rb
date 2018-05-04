class CreatePagamentos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagamentos do |t|
      t.decimal :valor
      t.date :data
      t.integer :fatura_id
      t.references :fatura, foreign_key: true

      t.timestamps
    end
  end
end
