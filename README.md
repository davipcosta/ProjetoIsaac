# Projeto Jogo RPG - Estruturas de Dados e Banco de Dados
📖 Sobre o Projeto

Este projeto foi desenvolvido como parte da disciplina de Estrutura de Dados no 3º semestre do curso de Engenharia de Computação.
O objetivo é implementar um jogo de RPG simples em Java utilizando estruturas de dados clássicas (pilha, fila e lista), integradas a um banco de dados MySQL para armazenamento das informações.

O jogo simula batalhas entre personagens, permitindo a criação de heróis, uso de habilidades e gerenciamento de turnos.

🎮 Funcionalidades
Cadastro de Personagens: criação e armazenamento no banco de dados MySQL.

Sistema de Batalha (PvP):
Controle de turnos usando Fila (Queue).
Histórico de ações armazenado em uma Pilha (Stack).
Lista encadeada para manipulação de personagens e habilidades.
Interface Gráfica feita em Java Swing (NetBeans GUI Builder).
Banco de Dados MySQL para persistência de dados dos jogadores e personagens.

🛠️ Tecnologias Utilizadas
Java 17 (linguagem principal)
NetBeans 23 (IDE de desenvolvimento)
Swing (interface gráfica)

Estruturas de Dados:
Pilha
Fila
Lista

MySQL (banco de dados relacional)

🗄️ Estruturas de Dados no Jogo
Fila (Queue): controla a ordem de turnos dos jogadores.
Pilha (Stack): armazena o histórico das jogadas (possível implementar "desfazer" ou revisar movimentos).
Lista: gerenciamento dos personagens e habilidades disponíveis.

🗃️ Banco de Dados
O projeto utiliza MySQL para armazenar:
Dados de jogadores (login, senha, etc.)
Dados de personagens (nome, atributos, HP, mana, habilidades)
Resultados das batalhas
