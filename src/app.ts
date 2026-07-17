import express from 'express';

const app = express();

app.use(express.json());

// Rota de Health Check (útil para monitoramento em produção e testes de CI)
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'UP', timestamp: new Date().toISOString() });
});

// Endpoint de exemplo retornando dados simulados
app.get('/api/users', (req, res) => {
  res.status(200).json([
    { id: 1, name: 'Alice DevSecOps' },
    { id: 2, name: 'Bob GitHubActions' }
  ]);
});

export default app;
