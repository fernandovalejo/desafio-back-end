class LojasController < ApplicationController

  def index
    @lojas = Loja.include(:transacao).select()
  end

end