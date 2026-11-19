fetch('/api/health')
  .then(resposta => resposta.json())
  .then(dados => {
    document.querySelector('#status').textContent = `Status da API: ${dados.status}`
    document.querySelector('#horario').textContent = new Date(dados.horario).toLocaleString('pt-BR')
  })
  .catch(() => document.querySelector('#status').textContent = 'API indisponível')
