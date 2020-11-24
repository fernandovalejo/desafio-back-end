class Loja < ApplicationRecord
  belongs_to :dono

  validates :nome, uniqueness: true, presence: true
end
