class Transacao < ApplicationRecord
  belongs_to :tipo_transacao
  belongs_to :loja
end
