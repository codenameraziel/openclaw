# Usa Node.js oficial
FROM node:22-alpine

# Define diretório de trabalho
WORKDIR /usr/src/app

# Copia package.json e instala dependências
COPY package*.json ./
RUN npm install --production

# Copia o restante do código
COPY . .

# Porta padrão do gateway
EXPOSE 18790

# Comando de inicialização
CMD ["npm", "start"]
