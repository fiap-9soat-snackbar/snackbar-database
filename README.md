# Snackbar Database

## Visão Geral
Este projeto tem como objetivo provisionar o sistema de banco de dados da aplicação **Snackbar**, utilizando **MongoDB Atlas** e **Terraform**.  

A infraestrutura é gerenciada pelo **Terraform**, garantindo que o banco de dados seja configurado corretamente e acessível para a aplicação. Além disso, o projeto contém scripts para restaurar os dados iniciais das coleções **products** (produtos do cardápio) e **orders** (pedidos dos clientes) dentro do banco de dados **Snackbar**.

## Estrutura do Projeto
O projeto é composto pelos seguintes arquivos:

- **02-products-restore.js**: Script para restaurar a coleção `products` no MongoDB.
- **03-orders-restore.js**: Script para restaurar a coleção `orders` no MongoDB.
- **backend.tf**: Configuração do backend do Terraform.
- **main.tf**: Define o módulo de provisionamento do MongoDB Atlas via Terraform.
- **outputs.tf**: Define os outputs do Terraform, como a string de conexão ao banco de dados.
- **variables.tf**: Define as variáveis sensíveis e configuráveis do Terraform.

## Tecnologias Utilizadas
- **MongoDB Atlas**: Banco de dados NoSQL na nuvem.
- **Terraform**: Infraestrutura como código para provisionamento do banco.
- **JavaScript**: Utilizado para os scripts de restauração de dados.

## Configuração e Uso

### 1. Configurar as variáveis de ambiente
Antes de executar os scripts e o Terraform, configure as variáveis necessárias no arquivo `variables.tf`, incluindo credenciais de acesso ao MongoDB Atlas e AWS.

### 2. Provisionamento da Infraestrutura
Execute os seguintes comandos para iniciar a infraestrutura:

```sh
terraform init
terraform apply
```
Isso irá criar o projeto no MongoDB Atlas e configurar os recursos necessários.

### 3. Restaurar os Dados
Após o provisionamento, restaure os dados executando os scripts no MongoDB:

```sh
mongosh "<connection_string>" --username <usuario> --password <senha> --eval "load('02-products-restore.js')"
mongosh "<connection_string>" --username <usuario> --password <senha> --eval "load('03-orders-restore.js')"
```

### 4. Verificar os Dados
Para verificar os dados inseridos, acesse o MongoDB Atlas e consulte as coleções products e orders.

## Estrutura dos Dados

### Coleção `products`

Contém os produtos disponíveis no snackbar, com os seguintes campos:

- `name`: Nome do produto
- `category`: Categoria do produto (Lanche, Bebida, Acompanhamento, etc.)
- `description`: Descrição do produto
- `price`: Preço do produto
- `cookingTime`: Tempo de preparo em minutos
- `image`: URL da imagem do produto

### Coleção orders

Armazena os pedidos realizados, contendo os campos:

- `orderNumber`: Número do pedido
- `orderDateTime`: Data e hora do pedido
- `cpf`: CPF do cliente
- `name`: Nome do cliente
- `items`: Lista de itens do pedido (produto, quantidade, preço, etc.)
- `statusOrder`: Status do pedido (ex: "PAGO")
- `paymentMethod`: Método de pagamento
- `totalPrice`: Preço total
- `remainingTime`: Tempo restante para conclusão
