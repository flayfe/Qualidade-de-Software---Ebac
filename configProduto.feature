Feature: Configurar produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto
  E escolher a quantidade
  Para depois inserir no carrinho

  Background:
    Given que eu acesse a página do EBAC-SHOP

  Scenario Outline: Seleções de cor, tamanho e quantidade válidos
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem "Produto adicionado ao carrinho"

    Examples:
      | cor    | tamanho | quantidade |
      | blue   | XS      | 1          |
      | orange | S       | 5          |
      | red    | M       | 9          |
      | blue   | L       | 10         |
      | orange | XL      | 11         |

  Scenario Outline: Seleções de cor, tamanho e quantidade inválidos
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a <mensagem>

    Examples:
      | cor    | tamanho | quantidade | mensagem                             |
      | null   | XS      | 1          | Necessário selecionar uma cor        |
      | blue   | null    | 1          | Necessáiro selecionar um tamanho     |
      | blue   | L       | 11         | Permitido selecionar até 10 produtos |
      | orange | S       | 0          | Quantidade inválida                  |
      | red    | M       | null       | Favor informar uma quantidade        |

  Scenario: Limpar configuração dos produtos
    When eu clicar no botão "Limpar"
    Then deve aparecer a mensagem "Selecione a cor e o tamanho desejados"
