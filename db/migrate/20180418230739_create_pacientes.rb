class CreatePacientes < ActiveRecord::Migration[5.1]
  def change
    create_table :pacientes do |t|
      t.string :nome
      t.string :telefone
      t.text :observacao
      t.string :email
      t.date :nascimento
      t.string :sexo
      t.date :paciente_desde

      t.timestamps
    end
  end
end
