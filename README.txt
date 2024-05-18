# Sistema de Gerenciamento de Abastecimentos - Posto ABC

# Desenvolvido em Delphi 11.3 - Alexandria e Firebird 5.0

# Descrição
O Sistema de Gerenciamento de Abastecimentos é uma aplicação Delphi desenvolvida para controlar abastecimentos realizados no do posto ABC. 
O sistema calcula automaticamente impostos sobre os abastecimentos e gera relatórios detalhados para acompanhamento e controle.

# Funcionalidades

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

#  Informações Técnicas
- O banco de dados é criado de forma totalmente dinâmica na pasta db (dentro da pasta do exe)
- Os dados são armazenados em banco de dados Firebird usando o componente FireDAC para manipulação dos dados.

# Observações
- Este README é um guia básico. 

## Autor
- [Leandro B. Gaspar]
  
## Data/Local de Criação
- [17/05/2023 / Piraju-SP]

## Link do projeto no Github
https://github.com/LeandroGasparDev/PostoABC

Leandro B. Gaspar | Programador Delphi
Telefone/WhatsApp:  (014) 99790-6406
E-mail: leandrogaspar2012@gmail.com
GitHub: LeandroGasparDev
Linkedin: https://www.linkedin.com/in/leandrogaspardev/

