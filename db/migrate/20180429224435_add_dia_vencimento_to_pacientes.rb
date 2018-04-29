class AddDiaVencimentoToPacientes < ActiveRecord::Migration[5.1]
  def change
    add_column :pacientes, :dia_vencimento, :integer
  end
end
