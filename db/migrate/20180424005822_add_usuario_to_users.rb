class AddUsuarioToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :usuario, :string
  end
end
