# Sistema de Gerenciamento de Abastecimentos - Posto ABC

# Desenvolvido em Delphi 11.3 - Alexandria e Firebird 5.0

# Descrição
O Sistema de Gerenciamento de Abastecimentos - Posto ABC, é uma aplicação, desenvolvida para controlar abastecimentos realizados no do posto ABC. 
O sistema calcula automaticamente impostos sobre os abastecimentos e gera relatórios detalhados para acompanhamento e controle.

#  Informações Técnicas
- Foi utilizado Firebird 5.0 para a criação do banco de dados
- O banco de dados é criado de forma dinâmica, encapsulado no codigo fonte do projeto, é criado na pasta "DB" (dentro da pasta do .exe)

# Funcionalidades Implementadas

1- Cadastar/Lançar Abastecimentos:
  - Permite registrar a data, litos abastecidos, valor do abastecimento e a bomba utilizada.
  - Calcula automaticamente o imposto sobre o valor abastecido
    - Obs: Imposto pode ser configurado na tabela de PARAMETROS_SISTEMA

2- Lista de Abastecimentos
  - Exibe uma Pesquisa Avançada com filtros por período dos abastecimentos realizados
  - Exibe os Abastecimentos conforme filtro realizado
  -	Permite Casdtrar/Lançar um novo Abastecimento

3- Relatório:
  - Relatório de Abatecimentos por Período, onde agrupa os abastecimentos por data, bomba, tanque, e exibe os totais de litros e valor de abastecimento(com imposto).
  -	Apresenta a soma total do valor abastecido no período escolhido.


# Funcionalidades NÃO Implementadas
  - Tela - Cadastro/Alteração de Tanques
  - Tela - Cadastro/Alteração de Bombas
  - Tela - Alteração de Parametros do Sistema


# Observações
- Este README é um guia básico. 

## Autor
- [Leandro B. Gaspar]
  
## Data/Local de Criação
- [17/05/2024 / Piraju-SP]

## Link do projeto no Github
https://github.com/LeandroGasparDev/PostoABC

Leandro B. Gaspar | Programador Delphi
Telefone/WhatsApp:  (014) 99790-6406
E-mail: leandrogaspar2012@gmail.com
GitHub: LeandroGasparDev
Linkedin: https://www.linkedin.com/in/leandrogaspardev/

