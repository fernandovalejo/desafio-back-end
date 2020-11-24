class LojasController < ApplicationController

  def index
    @q = Loja.joins("left join TRANSACOES t on t.loja_id = LOJAS.id")
             .select(:id, :nome, "sum(t.valor) AS saldo").group(:id).ransack(params[:q])
    # @q = Loja.all.ransack params[:q]
    @pagy, @lojas = pagy(@q.result)
  end

end