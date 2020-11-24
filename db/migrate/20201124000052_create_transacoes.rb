class CreateTransacoes < ActiveRecord::Migration[6.0]
  def change
    create_table :transacoes do |t|
      t.references :tipo_transacao, null: false, foreign_key: true
      t.references :loja, null: false, foreign_key: true
      t.datetime :data_hora
      t.string :cartao
      t.decimal :valor

      t.timestamps
    end
  end
end
