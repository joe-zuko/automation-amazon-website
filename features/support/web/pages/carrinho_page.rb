class Carrinho < SitePrism::Page
  include Capybara::DSL

  element :botaoCompra, "#sc-buy-box-ptc-button"
  element :botaoExcluir, "input[type='submit'][data-action='delete']"
  element :msgExcluir, ".sc-your-amazon-cart-is-empty"
  element :valorTotal, "#sc-subtotal-amount-activecart"
  element :valorTotalbox, "#sc-subtotal-amount-buybox"
  element :precoUm, "[data-item-count='1'] .sc-product-price"
  element :precoDois, "[data-item-count='2'] .sc-product-price"
  element :precoTres, "[data-item-count='3'] .sc-product-price"

  def finalizar_compra
    botaoCompra.click
  end

  def excluir
    botaoExcluir.click
  end

  def msg_excluido
    msgExcluir.text
  end

  def preco_produtos
    precoColunas.split
  end

  def valor_total
    valorTotal.text.gsub(/[R$ .,]/, "R" "$" " " "." => "", "," => ".")
  end

  def valor_total_box
    valorTotalbox.text.gsub(/[R$ .,]/, "R" "$" " " "." => "", "," => ".")
  end

  def soma_produtos
    valor_primeiro_produto = precoUm.text.split.select { |numeros| numeros.to_f >= 1 }
    valor_segundo_produto = precoDois.text.split.select { |numeros| numeros.to_f >= 1 }
    valor_terceiro_produto = precoTres.text.split.select { |numeros| numeros.to_f >= 1 }

    @conta = valor_primeiro_produto[0].gsub(/[.,]/, "." => "", "," => ".").to_f + valor_segundo_produto[0].gsub(/[.,]/, "." => "", "," => ".").to_f + valor_terceiro_produto[0].gsub(/[.,]/, "." => "", "," => ".").to_f
    @resultado = sprintf("%.2f", @conta)
  end
end
