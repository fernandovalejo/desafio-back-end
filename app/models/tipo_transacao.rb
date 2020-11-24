class TipoTransacao < ApplicationRecord
  has_many :transacaos

  validates_presence_of :descricao, :natureza
  validates :descricao, uniqueness: true
  attribute :natureza, :integer

end
