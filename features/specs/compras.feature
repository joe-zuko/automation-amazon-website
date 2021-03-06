#language: pt
@compras
Funcionalidade: Compras
    Para que eu possa comprar meus produtos
    Sendo um usuário previamente cadastrado
    Posso utilizar o carrinho de compras para finalizar meu pedido


    @add_carrinho
       Cenario: Adicionar ao Carrinho
       Dado que procuro por "Akira - Vol. 5" na barra de busca e entro nos detalhes do produto
       E verifico se o valor de capa é o mesmo valor do box do carrinho
       E também adiciono "Akira - Vol. 06" e "Akira - Vol. 3" 
       Então a soma dos produtos deve ser igual ao valor total mostrado na pagina

    @exluir_carrinho
       Cenario: Excluir Carrinho
       Dado que procuro por "Vagabond - Volume 25" na barra de busca e entro nos detalhes do produto
       Então devo excluir ele do carrinho
       E ver a mensagem "Seu carrinho da Amazon está vazio"
   
    @busca_infeliz
    Cenario: Busca não retorna nada

        Dado que procuro por "@#$@!" na barra de busca
        Então vejo a mensagem "Nenhum resultado para @#$@!."

    @compra_boleto
    Cenario: Compra com boleto

        Dado que eu adiciono "Akira - Vol. 4" ao meu carrinho
        E fecho o pedido
        E escolho o endereço que quero enviar junto com a entrega padrão
        Quando eu clico em pagar com boleto 
        Então devo ver o botão confirmar pedido
        E a soma do produto mais o frete deve ser igual ao valor total a ser pago


        
   
  