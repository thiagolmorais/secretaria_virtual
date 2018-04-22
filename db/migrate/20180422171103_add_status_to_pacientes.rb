class AddStatusToPacientes < ActiveRecord::Migration[5.1]
  def change
    add_column :pacientes, :status, :boolean, default: true
  end
end
