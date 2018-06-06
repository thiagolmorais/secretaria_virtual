class CreateConfiguracaos < ActiveRecord::Migration[5.1]
  def change
    create_table :configuracaos do |t|
      t.integer :duracao_consulta, default: 1
      t.integer :periodo_reajuste, default: 12

      t.timestamps
    end
  end
end
