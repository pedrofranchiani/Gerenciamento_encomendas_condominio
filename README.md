# Gerenciamento de Encomendas de Condomínio

Este projeto é um banco de dados desenvolvido para gerenciar de forma eficiente as encomendas recebidas por um condomínio, registrando detalhes como o nome do destinatário, data de recebimento, status da entrega e número da unidade.

## Objetivo

O objetivo do sistema é facilitar o controle e a organização das entregas, minimizando erros e melhorando a experiência dos moradores e da equipe de administração.

## Funcionalidades

- **Registro de Encomendas**: Armazena informações sobre cada encomenda recebida, como destinatário, data de recebimento, status e unidade.
- **Controle de Entregas**: Permite monitorar o status de entrega de cada encomenda.
- **Consulta e Relatórios**: Facilidade para consulta de registros e geração de relatórios para administração do condomínio.

## Tecnologias Utilizadas

- **Banco de Dados Relacional (MySQL)**: Utilizado para armazenar e gerenciar dados de forma segura e eficiente.
- **Modelagem de Dados**: Diagramas de Entidade-Relacionamento (ER) para garantir integridade e otimização do banco de dados.

## Estrutura do Projeto

**Tabelas Principais**:
  - **ENCOMENDA**: Armazena detalhes sobre cada encomenda recebida, incluindo a data de recebimento e o status da entrega.
  - **DESTINATARIO**: Armazena informações sobre os destinatários das encomendas.
  - **CONFIRMACAO**: Registra os códigos de confirmação de entrega associados a cada destinatário.


## IDÉIAS FUTURAS
  - Fazer a integração com uma interface web, facilitando as inserções no banco de dados pelos responsaveis do recebimento das encomendas.
  - Automação para disparo de mensagem ao DESTINATARIO na chegada da ENCOMENDA, assim como repetição de mensagem com frequencia a ser definida, visando diminuir o volume de encomendas no espaço destinado para tal.
