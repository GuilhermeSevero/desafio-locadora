import setDefaultRoutes from '../classes/routes'
import MovieController from '../controllers/movie'

import HttpStatus from 'http-status'


export default (app) => {
    const movieController = new MovieController(app.datasource.models, 'movie')

    setDefaultRoutes(app, movieController, 'filmes')

    app.route(`/filmes/:id/alugar`)
        .all(app.auth)
        .post((req, res) => {
            movieController.rent(req.params.id, req.userId)
                .then(result => {
                    res.status(result.statusCode)
                    res.json(result.data)
                })
        })

        app.route(`/filmes/:id/devolver`)
            .all(app.auth)
            .post((req, res) => {
                if (!req.body.hasOwnProperty('amount')) {
                    res.status(HttpStatus.BAD_REQUEST)
                    res.json({ erro: 'Parâmetro "amount" é obrigatório!' })
                } else {
                    movieController.rent(req.params.id, req.userId, req.body.amount)
                        .then(result => {
                            res.status(result.statusCode)
                            res.json(result.data)
                        })
                }
            })
}
