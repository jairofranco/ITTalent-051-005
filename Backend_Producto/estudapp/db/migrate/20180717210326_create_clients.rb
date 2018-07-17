class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :identification
      t.string :mail
      t.references :rol, foreign_key: true

      t.timestamps
    end
  end
end
