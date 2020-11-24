class CreateLojas < ActiveRecord::Migration[6.0]
  def change
    create_table :lojas do |t|
      t.references :dono, null: false, foreign_key: true
      t.string :nome

      t.timestamps
    end
  end
end
