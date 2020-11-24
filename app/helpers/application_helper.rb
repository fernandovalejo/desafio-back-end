module ApplicationHelper
  include Pagy::Frontend

  def formata_valor(valor)
    valor ? number_with_precision(valor, precision: 2) : '0,00'
  end

  def formata_data_hora(data)
    data&.strftime('%d/%m/%Y - %H:%M')
  end

end
