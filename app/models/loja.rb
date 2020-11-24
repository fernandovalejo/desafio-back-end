class Loja < ApplicationRecord
  belongs_to :dono

  validates :nome, uniqueness: true, presence: true

  def nome=(nome)
    super nome = nome.strip if nome
  end
end
