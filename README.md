# API Node.js - Estudos de DevSecOps & GitHub Actions

Este é um projeto de API em Node.js com TypeScript e Express, estruturado para fins didáticos no aprendizado de conceitos de **DevSecOps** e integração contínua (CI) usando **GitHub Actions**.

---

## 🚀 Tecnologias Utilizadas

- **Runtime:** Node.js
- **Linguagem:** TypeScript (garante validação de sintaxe e tipagem em tempo de compilação)
- **Framework Web:** Express
- **Framework de Testes:** Vitest (com Supertest para testes de integração de API)
- **Segurança (DevSecOps):** `npm audit` integrado ao pipeline para análise de vulnerabilidades de dependências (Software Composition Analysis - SCA).

---

## 🛠️ Comandos Principais

Antes de enviar o projeto para o GitHub, você pode rodar os comandos localmente para validar a aplicação:

### 1. Instalar as dependências do projeto
```bash
npm install
```

### 2. Compilar/Buildar o projeto
Compila o código TypeScript para JavaScript na pasta `/dist`, garantindo que não há erros de sintaxe ou tipagem.
```bash
npm run build
```

### 3. Executar a suíte de testes unitários
Roda os testes automatizados da aplicação.
```bash
npm run test
```

### 4. Executar em modo de desenvolvimento (Live Reload)
```bash
npm run dev
```

### 5. Executar auditoria de segurança das dependências (SCA)
Verifica se as dependências possuem vulnerabilidades conhecidas.
```bash
npm run security-audit
```

---

## 🛡️ Pipeline de DevSecOps (GitHub Actions)

A esteira de integração contínua está definida em `.github/workflows/ci.yml`. Toda vez que você fizer um `git push` ou abrir um `Pull Request` para as branches principais (`main`, `master`), o GitHub Actions executará automaticamente:

1. **Checkout:** Obtém a cópia do seu código.
2. **Setup Node.js:** Instala e configura a versão 20 do Node.js.
3. **Instalação Limpa (`npm ci`):** Garante a instalação exata das dependências especificadas no `package-lock.json`.
4. **Build (`npm run build`):** Garante que o projeto compila sem erros.
5. **Testes (`npm run test`):** Roda os testes unitários/integração para garantir que nada foi quebrado.
6. **Segurança (`npm audit`):** Bloqueia o deploy ou alerta sobre dependências vulneráveis (nível alto/crítico).

---

## 📁 Estrutura do Projeto

```text
node-api-devsecops/
├── .github/
│   └── workflows/
│       └── ci.yml          # Definição do Pipeline do GitHub Actions
├── src/
│   ├── app.ts              # Configuração do Express e endpoints
│   ├── server.ts           # Inicialização e escuta da porta do servidor
│   └── app.test.ts         # Testes de integração/unitários da API
├── package.json            # Scripts e dependências do Node.js
├── tsconfig.json           # Configuração de compilação do TypeScript
└── README.md               # Este arquivo de documentação
```

---

## 📤 Como enviar para o seu GitHub

1. Inicialize o repositório git **dentro da pasta do projeto**:
   ```bash
   cd node-api-devsecops
   git init
   ```
2. Adicione todos os arquivos:
   ```bash
   git add .
   ```
3. Realize o primeiro commit:
   ```bash
   git commit -m "feat: estrutura inicial da api e pipeline de DevSecOps"
   ```
4. Crie um repositório vazio no GitHub.
5. Vincule o repositório local ao GitHub (substitua pelo seu link do GitHub):
   ```bash
   git remote add origin https://github.com/SEU_USUARIO/NOME_DO_REPOSITORIO.git
   git branch -M main
   ```
6. Envie o código:
   ```bash
   git push -u origin main
   ```

A partir do momento em que enviar, acesse a aba **Actions** no seu repositório no GitHub para ver o pipeline rodando em tempo real!
