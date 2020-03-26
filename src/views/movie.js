import setDefaultRoutes from '../classes/routes'
import MovieController from '../controllers/movie'

export default (app) => {
    const movieController = new MovieController(app.datasource.models.movie)

    setDefaultRoutes(app, movieController, 'filmes')
}
