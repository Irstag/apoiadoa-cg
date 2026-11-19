import express from 'express'

const app = express()

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', horario: new Date().toISOString() })
})

app.listen(process.env.PORT || 3000)
