class CreateTipoTransacoes < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_transacoes do |t|
      t.string :descricao
      t.boolean :natureza, default: false

      t.timestamps
    end
  end
end
