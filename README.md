# Portaria

Aplicativo para controlar o acesso de visitantes em um condomínio ou empresa.

Para este projeto foi utilizado o Cocoapods, para gerenciar as bibliotecas utilizadas. No projeto foram utilizada a seguintes biblioteca:

Realm.io - para gerenciar o banco de dados;

## Instrução

Acessar a pasta do projeto e executar o seguinte comando:

pod install

Com isso as bibliotecas serão instaladas. Duranta a instalação das bibliotecas.

Após a instalação abra o xcode -> File -> Open -> Selecione a pasta onde o projeto foi salvo -> Abra o arquivo Portaria.xcworkspace

Após o projeto aberto é só executar.

## Objetivo do Aplicativo

O aplicativo tem como objetivo de gerenciar a entrada e saída de visitantes de uma portaria.

## Breve Descrição

Na primeira vez que o aplicativo é executado, será apresentada a tela de login, como não existe uma autenticação, é só pressionar o botão de Entrar. Na segunda vez não será necessário que o usuário faça esse processo.

A primeira tela do aplicativo será a lista de visitantes cadastrados, onde o usuério poderá realiza o cadastro de um novo visitante, pressionando o icone de +, no canto superior direito, também poderá realizar uma pesquisa por um determinado período, Semana, Mês ou Ano.

Na tela de cadastro do visitante o operador pode optar por registrar o visitante na lista de contatos.

## Funcionalidades Implementadas

- Listagem de Visitantes, quando o visitante não teve a saída registrada, o nome e a categoria ficam em vermelhos, caso contrário fica preto;

- Cadastro de Visitantes;

- Tela de Login, sem a parte do servidor. Issue aberta - Login #3;

- Filtrar visitas por semana, mês ou ano. Issue aberta para melhorar o filtro - Filtro por período #16;

## Teste

Para executar os testes, com o projeto aberto no Xcode é só pressionar as teclas Command + u.

## Melhorias

Existe algumas issues abertas para este projeto, onde podem ser implementadas para melhorar a experiência do operador.
