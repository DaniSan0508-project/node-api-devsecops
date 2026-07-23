# ==========================================
# Estágio 1: Builder (Compilação do Código)
# ==========================================
FROM node:24-alpine AS builder

# Atualiza pacotes do sistema para mitigar vulnerabilidades de SO da imagem base
RUN apk update && apk upgrade --no-cache

# Define o diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copia os arquivos de definição de pacotes
COPY package*.json ./

# Instala TODAS as dependências (incluindo devDependencies como typescript e vitest)
RUN npm ci

# Copia todo o resto do código da aplicação (respeitando o .dockerignore)
COPY . .

# Compila o TypeScript para JavaScript (gera a pasta dist/)
RUN npm run build

# ==========================================
# Estágio 2: Runner (Imagem final de Produção)
# ==========================================
FROM node:24-alpine AS runner

# Atualiza pacotes do sistema para mitigar vulnerabilidades de SO da imagem base
RUN apk update && apk upgrade --no-cache

# Atualiza o NPM global para mitigar vulnerabilidades internas de pacotes do próprio NPM
RUN npm install -g npm@latest

# Define o ambiente como produção
ENV NODE_ENV=production
ENV PORT=3000

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia novamente os pacotes para instalação limpa de produção
COPY package*.json ./

# Instala APENAS as dependências necessárias para rodar em produção (ignora devDependencies)
RUN npm ci --only=production

# Copia apenas os arquivos compilados do estágio anterior (Builder)
COPY --from=builder /usr/src/app/dist ./dist

# Garante que a aplicação rodará com o usuário 'node' (sem privilégios root)
USER node

# Indica a porta que o container escutará
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "dist/server.js"]
