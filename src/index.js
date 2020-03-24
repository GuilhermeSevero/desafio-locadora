import app from './app'

app.listen(app.get('port'), () => {
    console.log(process.env)
    console.log(`API Locadora de Filmes Executando na porta ${app.get('port')}`)
})
