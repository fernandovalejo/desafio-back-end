class TransacoesController < ApplicationController
  before_action :set_loja, only: :index
  before_action :set_service, only: :create


  def index
    @q = Transacao.where(loja: @loja).ransack params[:q]
    @pagy, @transacoes = pagy(@q.result)
  end

  def new
  end

  def create
    if params[:arquivo_cnab]
      @cnab.carga(params[:arquivo_cnab])
      redirect_to lojas_path, notice: "Arquivo importado com sucesso!"
    else
      render :new, alert: "É necessário fazer o upload do arquivo!"
    end
  end

  private

  def set_service
    @cnab = Cnab.new
  end

  def set_loja
    @loja = Loja.find(params[:loja_id])
  end

end