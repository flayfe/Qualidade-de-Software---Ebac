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
      | blue   | XL      | 11         |

  Scenario Outline: Seleções de cor inválida
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem de erro "Selecionar Cor: Por favor, escolha uma opção"

    Examples:
      | cor  | tamanho | quantidade |
      | null | XS      | 1          |
      | null | S       | 5          |
      | null | M       | 9          |
      | null | L       | 10         |
      | null | XL      | 11         |

  Scenario Outline: Seleções de tamanho inválido
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem de erro "Selecionar Tamanho: Por favor, escolha uma opção"

    Examples:
      | cor    | tamanho | quantidade |
      | blue   | null    | 1          |
      | orange | null    | 5          |
      | red    | null    | 9          |
      | blue   | null    | 10         |
      | blue   | null    | 11         |

  Scenario Outline: Seleções de quantidade inválida
    When eu selecionar a <cor>
    And o <tamanho>
    And a <quantidade>
    Then deve emitir a mensagem de erro <mensagem>

    Examples:
      | cor    | tamanho | quantidade | mensagem                             |
      | blue   | XS      | 11         | Permitido selecionar até 10 produtos |
      | orange | S       | 0          | Quantidade inválida                  |
      | red    | M       | null       | Quantidade inválida                  |
      | blue   | L       | 15         | Permitido selecionar até 10 produtos |
      | blue   | XL      | 30         | Permitido selecionar até 10 produtos |

  Scenario: Limpar configuração dos produtos
    When eu clicar no botão "Limpar"
    Then deve aparecer a mensagem "Selecione a cor e o tamanho desejados"

Feature: Autenticação de usuário
  Como cliente da EBAC-SHOP
  Quero autenticar usuário e senha
  Para acessar a página de checkout

  Background:
    Given que eu acesse a página de autenticação do EBAC-SHOP

  Scenario Outline: Login e senha válidos
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Olá, <nome>" na página de checkout

    Examples:
      | usuario              | senha        | nome     |
      | flavia@gmail.com     | uG%VZsko%giz | flavia   |
      | fernanda@hotmail.com | 3@Zqaj5FqGzm | fernanda |
      | felipe@yahoo.com.br  | t&RNur4A$6t4 | felipe   |
      | tiago@gmail.com      | ^tkUMX4kCvnE | tiago    |
      | cesar@outlook.com    | W^bI^#OBDYK^ | cesar    |
      | diego@yahoo.com.br   | qV^3s3@32r9D | diego    |

  Scenario Outline: Login inválido e senha válida
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Usuário ou senha inválidos"

    Examples:
      | usuario                  | senha        |
      | failflavia@gmail.com     | uG%VZsko%giz |
      | failfernanda@hotmail.com | 3@Zqaj5FqGzm |
      | failfelipe@yahoo.com.br  | t&RNur4A$6t4 |
      | failtiago@gmail.com      | ^tkUMX4kCvnE |
      | failcesar@outlook.com    | W^bI^#OBDYK^ |
      | faildiego@yahoo.com.br   | qV^3s3@32r9D |

  Scenario Outline: Login válido e senha inválida
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Usuário ou senha inválidos"

    Examples:
      | usuario              | senha    |
      | flavia@gmail.com     | 123@fail |
      | fernanda@hotmail.com | 123@fail |
      | felipe@yahoo.com.br  | 123@fail |
      | tiago@gmail.com      | 123@fail |
      | cesar@outlook.com    | 123@fail |
      | diego@yahoo.com.br   | 123@fail |

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
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "Deseja finalizar a compra?"

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep       | telefone       | endereço de e-mail                         |
      | Gabriel Pedro | da Paz           | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Aragão           | Brasil | Praça Carlos Gomes, 736                  | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | da Paz           | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680-970 | (75) 3716-4176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes            | Brasil | Rodovia RS-805, 662                      | São Pedro | 95714-970 | (54) 2747-9365 | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da Mota | Brasil | Rodovia RS-805, 795                      | São Pedro | 95714-970 | (54) 2724-2356 | thomasrenatoiagomonteiro@univap.br         |

  Scenario Outline: Campo nome incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo Nome é de preenchimento obrigatório. Deve conter apenas letras e espaço."

    Examples:
      | nome            | sobrenome        | país   | endereço                                 | cidade    | cep       | telefone       | endereço de e-mail                         |
      | Gabriel 123     | da Paz           | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br         |
      | null            | Aragão           | Brasil | Praça Carlos Gomes, 736                  | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro  Levi     | da Paz           | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680-970 | (75) 3716-4176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel (Manuel) | Gomes            | Brasil | Rodovia RS-805, 662                      | São Pedro | 95714-970 | (54) 2747-9365 | danielmanuelgomes@plaman.com.br            |
      | Thomas.         | Monteiro da Mota | Brasil | Rodovia RS-805, 795                      | São Pedro | 95714-970 | (54) 2724-2356 | thomasrenatoiagomonteiro@univap.br         |

  Scenario Outline: Campo sobrenome incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo Sobrenome é de preenchimento obrigatório. Deve conter apenas letras e espaço."

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep       | telefone       | endereço de e-mail                         |
      | Gabriel Pedro | da_Paz           | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Arag(ão)         | Brasil | Praça Carlos Gomes, 736                  | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | null             | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680-970 | (75) 3716-4176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes*           | Brasil | Rodovia RS-805, 662                      | São Pedro | 95714-970 | (54) 2747-9365 | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da 3074 | Brasil | Rodovia RS-805, 795                      | São Pedro | 95714-970 | (54) 2724-2356 | thomasrenatoiagomonteiro@univap.br         |
      |               |                  |        |                                          |           |           |                |                                            |

  Scenario Outline: Campo país sem informação
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "Favor selecionar um país."

    Examples:
      | nome          | sobrenome        | país | endereço                                 | cidade    | cep       | telefone       | endereço de e-mail                         |
      | Gabriel Pedro | da Paz           | null | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Aragão           | null | Praça Carlos Gomes, 736                  | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | da Paz           | null | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680-970 | (75) 3716-4176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes            | null | Rodovia RS-805, 662                      | São Pedro | 95714-970 | (54) 2747-9365 | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da Mota | null | Rodovia RS-805, 795                      | São Pedro | 95714-970 | (54) 2724-2356 | thomasrenatoiagomonteiro@univap.br         |

  Scenario Outline: Campo endereço incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo Endereço é de preenchimento obrigatório. Não deve conter caracteres especiais."

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep       | telefone       | endereço de e-mail                         |
      | Gabriel Pedro | da Paz           | Brasil | null                                     | Arapiraca | 57303-847 | (82) 3555-9471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Aragão           | Brasil | Praça Carlos Gomes, 736**                | Arapiraca | 57316-360 | (82) 2740-0898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | da Paz           | Brasil | Avenida Ministro Ȱliveira Brito 135, 895 | Abaré     | 48680-970 | (75) 3716-4176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes            | Brasil | Rodovia RS_805, 662                      | São Pedro | 95714-970 | (54) 2747-9365 | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da Mota | Brasil | null                                     | São Pedro | 95714-970 | (54) 2724-2356 | thomasrenatoiagomonteiro@univap.br         |
      |               |                  |        |                                          |           |           |                |                                            |

  Scenario Outline: Campo cidade incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo Cidade é de preenchimento obrigatório. Deve conter apenas letras e espaços."

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep      | telefone    | endereço de e-mail                         |
      | Gabriel Pedro | da Paz           | Brasil | Rua Francisco Pereira Lima, 365          | 4rapiraca | 57303847 | 82 35559471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Aragão           | Brasil | Praça Carlos Gomes, 736                  | null      | 57316360 | 82 27400898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | da Paz           | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abarɘ     | 48680970 | 75 37164176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes            | Brasil | Rodovia RS-805, 662                      | Sαo Pedro | 95714970 | 54 27479365 | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da Mota | Brasil | Rodovia RS-805, 795                      | Sαo Pedro  | 95714970 | 54 27242356 | thomasrenatoiagomonteiro@univap.br         |

  Scenario Outline: Campo cep incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo CEP é de preenchimento obrigatório. Deve conter apenas números."

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep     | telefone    | endereço de e-mail                         |
      | Gabriel Pedro | da Paz           | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | null    | 82 35559471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Aragão           | Brasil | Praça Carlos Gomes, 736                  | Arapiraca | 16360   | 82 27400898 | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | da Paz           | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | abacate | 75 37164176 | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes            | Brasil | Rodovia RS-805, 662                      | São Pedro | null    | 54 27479365 | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da Mota | Brasil | Rodovia RS-805, 795                      | São Pedro | null    | 54 27242356 | thomasrenatoiagomonteiro@univap.br         |

  Scenario Outline: Campo telefone incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo Telefone é de preenchimento obrigatório. Favor informar telefone com DDD."

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep      | telefone      | endereço de e-mail                         |
      | Gabriel Pedro | da Paz           | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303847 | null 35559471 | ggabrielpedrodapaz@superigi.com.br         |
      | Esther Laís   | Aragão           | Brasil | Praça Carlos Gomes, 736                  | Arapiraca | 57316360 | 00 27400898   | estherlaisaylaaragao@riscao.com.br         |
      | Pedro Levi    | da Paz           | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680970 | 75 null       | pedrolevibenjamindapaz-93@negleribeiro.com |
      | Daniel Manuel | Gomes            | Brasil | Rodovia RS-805, 662                      | São Pedro | 95714970 | null          | danielmanuelgomes@plaman.com.br            |
      | Thomas        | Monteiro da Mota | Brasil | Rodovia RS-805, 795                      | São Pedro | 95714970 | 54 272423     | thomasrenatoiagomonteiro@univap.br         |

  Scenario Outline: Campo e-mail incorreto
    When eu digitar <nome>
    And digitar <sobrenome>
    And digitar <país>
    And digitar <endereço>
    And digitar <cidade>
    And digitar <cep>
    And digitar <telefone>
    And digitar <endereço de e-mail>
    Then deve aparecer a mensagem "O campo e-mail é de preenchimento obrigatório. Favor informar e-mail válido."

    Examples:
      | nome          | sobrenome        | país   | endereço                                 | cidade    | cep      | telefone    | endereço de e-mail                           |
      | Gabriel Pedro | da Paz           | Brasil | Rua Francisco Pereira Lima, 365          | Arapiraca | 57303847 | 82 35559471 | null                                         |
      | Esther Laís   | Aragão           | Brasil | Praça Carlos Gomes, 736                  | Arapiraca | 57316360 | 82 27400898 | estherlaisaylaaragao@riscao,com,br           |
      | Pedro Levi    | da Paz           | Brasil | Avenida Ministro Oliveira Brito 135, 895 | Abaré     | 48680970 | 75 37164176 | pedrolevibenjamindapaz-93!!@negleribeiro.com |
      | Daniel Manuel | Gomes            | Brasil | Rodovia RS-805, 662                      | São Pedro | 95714970 | 54 27479365 | danielmanuelgomes@plaman.com                 |
      | Thomas        | Monteiro da Mota | Brasil | Rodovia RS-805, 795                      | São Pedro | 95714970 | 54 27242356 | thomasrenatoiagomonteiro@naoexiste.com.br    |
      |               |                  |        |                                          |           |          |             |                                              |
