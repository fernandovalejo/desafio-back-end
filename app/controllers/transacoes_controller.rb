class TransacoesController < ApplicationController

  before_action :set_service, only: :create

  def index
    @transacoes = Transacao.where(loja_id: @loja)
  end

  def new
  end

  def create

    if params[:arquivo_cnab]
      @cnab.carga(params[:arquivo_cnab])
      redirect_to transacoes_path, notice: "Arquivo importado com sucesso!"
    else
      render :new, alert: "É necessário fazer o upload do arquivo!"
    end
  end

  private

  def set_service
    @cnab = Cnab.new
  end

  def set_loja
    @loja = Loja.find(:loja_id)
  end

end