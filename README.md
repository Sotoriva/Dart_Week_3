executa a docker em segundo plano
`docker-compose up -d`

executa o build_runner para executar a cada alteração
`dart pub run build_runner watch`# DartWeek3_Backend

## DW #3 - Desafio 1
Na aula de hoje você aprendeu iniciar um projeto com Shelf, configurar os meddlewares e a iniciar uma nova rota.


**Portanto como desafio eu gostaria que:**

1. Crie e inicie um projeto novo com Shelf

2. Configure o cors para acesso de qualquer lugar

3. Crie um serviço Rest com o path /menu/ e retorne uma lista de pizzas com os campos:

   * id
   * nome
   * preco

---

## DW #3 - Desafio 2
Na aula de hoje você aprendeu a conectar com o banco de dados e implementamos algumas rotas.


**Portanto como desafio eu gostaria que:**

1. Você crie um banco de dados e crie uma tabela cardápio com os campos

   * id
   * nome
   * preço

2. Configure a conexão com o banco

3. Implemente o serviço "/menu" que você criou no outro desafio 1 e busque as informações na tabela cardápio e retorne o serviço

---

## DW #3 - Desafio 3
Na aula de hoje iniciamos no flutter certo?


**Portanto como desafio eu gostaria que:**

1. Crie um projeto Flutter
2. Configure o GET
3. Crie tres páginas Splash, Home e Login
4. Dentro da page Splash verifique se o usuário está logado
5. Se não tiver logado direcione o usuário para a página de Login não dando a opção do usuário voltar
6. Se usuário estiver logado direcione o usuário para a tela de Home não dando a opção do usuário voltar

---

## DW #3 - Desafio 4
Na aula de hoje aprendemos como buscar os dados na nossa api e apresentar na tela mostrando nosso cardápio.

**Portanto como desafio eu gostaria que:**

1. No projeto flutter já criado abra a tela de Home
2. Montar uma classe para buscar todos os dados do serviço que você construiu no primeiro desafio
3. Busque esses dados como aprendemos na aula e apresente na tela de HomePage
> Obs: Lembre de utilizar a Controller e o GetConnect do próprio GetX

---

## DW #3 - Desafio 5
Na aula de hoje finalizamos o nosso App.

**Portanto como desafio eu gostaria que:**

1. Crie uma tela de carrinho de compra
2. No desafio anterior vc implementou a tela de menu, sendo assim gostaria que quando selecionado um item nessa tela fosse aberto um Dialog com o nome e o preço do item selecionado.
> Obs: Utilize a gerência de estado do GetX para ajudar na seleção e o GetUtils para abrir um dialog sem precisar do contexto.