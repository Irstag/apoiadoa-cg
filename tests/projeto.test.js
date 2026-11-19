import test from 'node:test'
import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

const sql = readFileSync('database/schema.sql', 'utf8')

test('o banco tem as nove tabelas do MER', () => {
  assert.equal((sql.match(/CREATE TABLE /g) || []).length, 9)
})

test('o banco tem as nove chaves primárias', () => {
  assert.equal((sql.match(/PRIMARY KEY/g) || []).length, 9)
})
