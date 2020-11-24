class CreateDonos < ActiveRecord::Migration[6.0]
  def change
    create_table :donos do |t|
      t.string :cpf
      t.string :nome

      t.timestamps
    end
  end
end
