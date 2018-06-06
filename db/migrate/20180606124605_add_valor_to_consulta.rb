class AddValorToConsulta < ActiveRecord::Migration[5.1]
  def change
    add_column :consulta, :valor, :decimal
    add_reference :consulta, :precos, foreign_key: true
  end
end
