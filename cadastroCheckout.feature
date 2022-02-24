Feature: Tela de cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero fazer concluir meu cadastro
  Para finalizar minha compra

  Scenario Outline: Todos os campos obrigatórios corretos
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereco de e-mail>
    Then deve aparecer a mensagem "Deseja finalizar a compra?"

    Examples:
      | nome          | sobrenome | país   | endereço                                 | cidade    | cep       | telefone       | endereco de e-mail                         |
      | Gabriel Pedro | da Paz    | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br         |
      | Pedro Levi    | da Paz    | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680-970 | (75) 3716-4176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes     | Brasil | Rodovia RS-805, 662                      | São Pedro | 95714-970 | (54) 2747-9365 | danielmanuelgomes@plaman.com.br            |

  Scenario Outline: Cadstro com informações inválidas
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereco de e-mail>
    Then deve aparecer a <mensagem>

    Examples:
      | nome          | sobrenome | país   | endereço                        | cidade    | cep       | telefone       | endereco de e-mail                 | mensagem                                                 |
      | null          | Aragão    | Brasil | Praça Carlos Gomes, 736         | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br | O campo Nome é de preenchimento obrigatório.             |
      | Esther Laís   | null      | Brasil | Praça Carlos Gomes, 736         | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br | O campo Sobrenome é de preenchimento obrigatório.        |
      | Gabriel Pedro | da Paz    | null   | Rua Francisco Pereira Lima, 365 | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br | Favor selecionar um país.                                |
      | Gabriel Pedro | da Paz    | Brasil | null                            | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br | O campo Endereço é de preenchimento obrigatório.         |
      | Esther Laís   | Aragão    | Brasil | Praça Carlos Gomes, 736         | null      | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br | O campo Cidade é de preenchimento obrigatório.           |
      | Gabriel Pedro | da Paz    | Brasil | Rua Francisco Pereira Lima, 365 | Arapiraca | null      | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br | O campo CEP é de preenchimento obrigatório.              |
      | Gabriel Pedro | da Paz    | Brasil | Rua Francisco Pereira Lima, 365 | Arapiraca | 57303-847 | null null      | ggabrielpedrodapaz@superigi.com.br | O campo Telefone é de preenchimento obrigatório.         |
      | Gabriel Pedro | da Paz    | Brasil | Rua Francisco Pereira Lima, 365 | Arapiraca | 57303-847 | (82) 3555-9471 | null                               | O campo e-mail é de preenchimento obrigatório.           |
      | Gabriel 123   | da Paz    | Brasil | Rua Francisco Pereira Lima, 365 | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br | Nome inválido. Deve conter apenas letras e espaço.       |
      | Gabriel Pedro | da_Paz    | Brasil | Rua Francisco Pereira Lima, 365 | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br | Sobrenome inválido. Deve conter apenas letras e espaço   |
      | Esther Laís   | Aragão    | Brasil | Praça Carlos Gomes, 736**       | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br | Endereço inválido. Não deve conter caracteres especiais. |
      | Gabriel Pedro | da Paz    | Brasil | Rua Francisco Pereira Lima, 365 | 4rapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br | Cidade inválida. Deve conter apenas letras e espaços.    |
      | Esther Laís   | Aragão    | Brasil | Praça Carlos Gomes, 736         | Arapiraca | 16360     | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br | CEP inválido. Deve conter apenas números.                |
      | Esther Laís   | Aragão    | Brasil | Praça Carlos Gomes, 736         | Arapiraca | 57316-360 | 00 00000000    | estherlaisaylaaragao@riscao.com.br | Telefone inválido. Favor informar telefone com DDD.      |
      | Esther Laís   | Aragão    | Brasil | Praça Carlos Gomes, 736         | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao,com,br | E-mail inválido. Favor informar e-mail válido.           |
      |               |           |        |                                 |           |           |                |                                    |                                                          |
