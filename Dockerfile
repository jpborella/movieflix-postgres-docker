# Define a versão do node.js
FROM node:20

# Define o diretório de trabalho do contêiner
WORKDIR /app

# Copia o arquivo de dependências para dentro do contêiner
COPY package.json package-lock.json ./

# Instala as dependências
RUN npm install

# Copia o restante dos arquivos para dentro do contêiner
COPY . .

# Gera os arquivos do Prisma e compila a aplicação
RUN npx prisma generate
RUN npm run build

# Expor a porta 3000, que vai ser a porta usada pela aplicação
EXPOSE 3000

# Define o comando para inicializar a aplicação 
CMD ["npm", "start"]