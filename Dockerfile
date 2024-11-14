#  Imagem oficial do Node.js versão 18, que é adequada para rodar projetos React.
FROM node:18

# Diretório de trabalho dentro do container onde a aplicação será instalada e executada.
WORKDIR /app

# Copia os arquivos package.json e package-lock.json
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# Exponha a porta que a aplicação vai rodar 
EXPOSE 5173

# Instala o curl
RUN apt-get update && apt-get install -y curl

# Define o comando para rodar a aplicação usando Vite
CMD ["npm", "run", "dev"]
