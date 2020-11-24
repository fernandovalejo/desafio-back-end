class Dono < ApplicationRecord
  has_many :lojas

  validates_presence_of :nome, :cpf
  validates :nome, uniqueness: true
  validates :cpf, uniqueness: true
end
