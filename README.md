# Case de Avaliação para Estágio em DevOps

Este projeto é um frontend para consumir a PokeAPI e exibir informações sobre Pokémon. Abaixo estão as instruções para rodar o container localmente e informações sobre o pipeline de CI/CD que realiza o deploy automático para o Vercel.

## Requisitos

- **Docker**: Certifique-se de que o Docker esteja instalado e configurado corretamente na sua máquina. Caso não tenha o Docker, siga as instruções de instalação na [documentação oficial do Docker](https://docs.docker.com/get-docker/).
- **Git**: O Git deve estar instalado para clonar o repositório, caso necessário.

## Rodando o Container Localmente

Para rodar a aplicação localmente usando Docker, siga as etapas abaixo:

### Passo 1: Clonar o repositório

Se ainda não tiver o repositório clonado, execute:

```bash
git clone https://github.com/EstherMart/devopscasefront.git
cd repo-do-projeto
```

### Passo 2: Construir o Container
Dentro do diretório do projeto, execute o comando para construir a imagem Docker com base no Dockerfile:

```bash
docker build -t my-react-app .
```

### Passo 3: Rodar o Container
Depois que a imagem for construída, você pode rodar o container com o seguinte comando:

```bash
Copiar código
docker run -p 5173:5173 my-react-app
```

Isso fará com que a aplicação seja acessível.

### Passo 4: Acessar a Aplicação
Abra o navegador e acesse http://localhost:5173 para visualizar a aplicação rodando localmente.

## CI/CD - Workflow de Deploy Automático para Vercel
O projeto utiliza GitHub Actions para automação do deploy para o Vercel, toda vez que há um push na branch ```main```. Aqui estão os detalhes do pipeline:

### O que o Pipeline Faz:

Quando o workflow é acionado: A cada push na branch main, o GitHub Actions dispara o workflow de CI/CD configurado no arquivo ```.github/workflows/deploy.yml.```

### Passos do Workflow:

1. Checkout do código: O código é extraído do repositório.
2. Configuração do Node.js: A versão do Node.js necessária para o projeto é configurada.
3. Instalação das dependências: O comando npm install é executado para instalar todas as dependências do projeto.
4. Build do projeto: O comando npm run build é executado.
5. Deploy para o Vercel: O deploy é feito automaticamente para o Vercel usando a CLI do Vercel (vercel). O comando é executado com os tokens de autenticação e IDs configurados como segredos no repositório GitHub.

### Como o Deploy é Feito:

- **Vercel**: A aplicação é enviada para o Vercel automaticamente usando a CLI do Vercel.
- **Segredos do GitHub**: Para autenticar o deploy, você precisa configurar três segredos no seu repositório GitHub:
   - ```VERCEL_TOKEN```: Token gerado para autenticação na API do Vercel.
   - ```VERCEL_PROJECT_ID```: ID do projeto no Vercel.

Esses segredos são adicionados na seção Settings > Secrets and Variables > Actions do GitHub.
