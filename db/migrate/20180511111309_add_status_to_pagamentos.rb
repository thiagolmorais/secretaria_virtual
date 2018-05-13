class AddStatusToPagamentos < ActiveRecord::Migration[5.1]
  def change
    add_column :pagamentos, :status, :boolean, default: false
  end
end
