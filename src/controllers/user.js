import ControllerBase from '../classes/controller'
import { defaultResponse, errorResponse } from '../classes/responses'


class UserController extends ControllerBase {
    getByEmail(email) {
        return this.Aplicativos.findOne({ where: { email } })
            .then(result => defaultResponse(result))
            .catch(error => errorResponse(error.message))
    }
}

export default UserController
