class Cnab

  def carga(arquivo)
    Transacao.create(transacao_params(arquivo))
  end

  private

  def transacao_params(arquivo)
    dados = []
    File.foreach(arquivo.path) do |l|
      dono(l[19..29], l[48..61])
      dados << {
          tipo_transacao_id: l[0],
          loja_id: loja(l[62..80].rstrip, l[19..29]),
          data_hora: data_hora(l[1..8], l[42..47]),
          cartao: l[30..41],
          valor: valor(l[9..18], l[0])
      }
      puts dados.inspect
    end

    puts dados
    return dados
  end

  def loja(nome_loja, cpf_dono)
    dono = Dono.where(cpf: cpf_dono).first
    Loja.create(nome: nome_loja, dono_id: dono.id)
    return Loja.find_by(nome: nome_loja).id
  end

  def dono(cpf, nome)
    Dono.create(cpf: cpf, nome: nome.rstrip)
  end

  def data_hora(data, hora)
    return "#{data[0..3]}-#{data[4..5]}-#{data[6..7]} #{hora[0..1]}:#{hora[2..3]}:#{hora[4..5]}".to_datetime
  end

  def valor(valor, tipo)
    valor_f = valor.to_f
    if TipoTransacao.find(tipo).natureza?
      format('%.2f', (valor_f / 100))
    else
      format('%.2f', ((valor_f / 100) * -1))
    end
  end
end