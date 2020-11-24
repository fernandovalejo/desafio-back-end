class LojasController < ApplicationController

  def index
    @lojas = Loja.join("left join transacoes t on t.loja_id = loja.id").select("*, sum(t.valor)")
  end

end