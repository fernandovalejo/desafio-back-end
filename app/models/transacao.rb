class Transacao < ApplicationRecord
  belongs_to :tipo_transacao
  belongs_to :loja

  validates_presence_of :cartao, :valor, :data_hora
end
