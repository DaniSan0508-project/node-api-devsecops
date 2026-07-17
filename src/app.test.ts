import { describe, it, expect } from 'vitest';
import request from 'supertest';
import app from './app.js';

describe('API Endpoints Tests', () => {
  it('should return health status UP', async () => {
    const response = await request(app).get('/health');
    expect(response.status).toBe(200);
    expect(response.body.status).toBe('UP');
    expect(response.body).toHaveProperty('timestamp');
  });

  it('should return a list of users', async () => {
    const response = await request(app).get('/api/users');
    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBe(true);
    expect(response.body.length).toBe(2);
    expect(response.body[0].name).toBe('Alice DevSecOps');
  });
});
