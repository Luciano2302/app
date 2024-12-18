# Use uma imagem oficial do Node.js
FROM node:18-alpine

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia os arquivos de dependências para o contêiner
COPY package*.json tsconfig.json ./

# Instala as dependências
RUN npm install --legacy-peer-deps

# Copia todo o código do projeto para o contêiner
COPY . .

# Compila o TypeScript (se necessário)
RUN npm run build

# Expõe a porta padrão do React (3000)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
