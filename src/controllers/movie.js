
import ControllerBase from '../classes/controller'
import { defaultResponse, errorResponse } from '../classes/responses'

import RentController from './rent'


class MovieController extends ControllerBase {
    rent(movieId, userId) {
        return this.model.findByPk(movieId)
            .then(movie => {
                if (!movie) {
                    throw new Error('Filme não encontrado!')
                }
                if (movie.get('stock') < 1) {
                    throw new Error('Filme não possui estoque suficiente!')
                }
                movie.decrement('stock')

                const rent = new RentController(this.model.sequelize.models.rent)
                return rent.create({ userId, movieId, date: Date.now()})
            })
            .catch(error => errorResponse(error.message))
    }
}

export default MovieController
