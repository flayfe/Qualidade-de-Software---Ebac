Feature: Autenticação de usuário
  Como cliente da EBAC-SHOP
  Quero autenticar usuário e senha
  Para acessar a página de checkout

  Background:
    Given que eu acesse a página de autenticação do EBAC-SHOP

  Scenario Outline: Autenticar múltiplos usuários
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a mensagem "Olá, <nome>" na página de checkout

    Examples:
      | usuario              | senha        | nome     |
      | flavia@gmail.com     | uG%VZsko%giz | Flavia   |
      | fernanda@hotmail.com | 3@Zqaj5FqGzm | Fernanda |
      | felipe@yahoo.com.br  | t&RNur4A$6t4 | Felipe   |
      | tiago@gmail.com      | ^tkUMX4kCvnE | Tiago    |
      | cesar@outlook.com    | W^bI^#OBDYK^ | Cesar    |
      | diego@yahoo.com.br   | qV^3s3@32r9D | Diego    |

  Scenario Outline: Usuário inválido
    When eu digitar o <usuario>
    And a <senha>
    Then deve aparecer a <mensagem>

    Examples:
      | usuario          | senha        | mensagem                    |
      | flaviagmail.com  | uG%VZsko%giz | E-mail com formato inválido |
      | fail@hotmail.com | 3@Zqaj5FqGzm | Usuário inexistente         |

  Scenario Outline: Usuário com senha inválida
    When eu digitar o usuário "flavia@gmail.com"
    And a senha "123@fail"
    Then deve aparecer a mensagem "Usuário ou senha inválidos"
