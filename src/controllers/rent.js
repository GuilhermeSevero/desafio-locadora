import ControllerBase from '../classes/controller'
import { defaultResponse, errorResponse } from '../classes/responses'


class RentController extends ControllerBase {
    return(id) {
        return this.model.findByPk(id)
            .then(rent => {
                if (!rent) {
                    throw new Error('Registro de aluguel não encontrado!')
                }
                if (rent.get('return')) {
                    throw new Error('Aluguel já devolvido!')
                }
                return this.update({ return: Date.now() }, { id })
            })
            .catch(error => errorResponse(error.message))
    }
}

export default RentController
