class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.numeric :phone
      t.date :birthday
      t.date :since

      t.timestamps
    end
  end
end
