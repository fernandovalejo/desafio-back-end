class TipoTransacao < ApplicationRecord
  has_many :transacaos

  validates_presence_of :descricao, :natureza
  validates :descricao, uniqueness: true

  attribute :natureza, :integer

  def descricao=(descricao)
    super descricao = descricao.strip if descricao
  end

  def to_s
    descricao
  end
end
