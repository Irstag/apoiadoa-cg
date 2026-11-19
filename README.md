# ApoiaDoa CG

Projeto acadêmico para a ONG fictícia Mãos à Mesa CG, desenvolvido no Projeto Integrador Extensionista II do curso de Análise e Desenvolvimento de Sistemas, Universidade de Marília.

Aluno: Igor Sontag

## Como rodar

Instale o Vite+ e o MySQL. Dentro da pasta do projeto:

```powershell
vp install
Copy-Item .env.example .env
vp run api
```

Em outro terminal, na mesma pasta:

```powershell
vp dev
```

Abra `http://localhost:5173`. A página deve mostrar `Status da API: ok` e a data e hora.

## Banco de dados

No MySQL, execute duas vezes:

```sql
SOURCE database/schema.sql;
```

O comando recria o banco `apoiadoa_cg` do zero e apaga os dados anteriores. Para uso apenas no banco de exercício.

## Testes básicos

```powershell
vp run test
```

## Uso de inteligência artificial

Este trabalho contou com apoio de inteligência artificial para compreender os requisitos e revisar o código. O conteúdo foi conferido, revisado e aprovado pelo estudante, que permanece responsável pela autoria, pela análise apresentada e pela versão final entregue.
