import setDefaultRoutes from '../classes/routes'
import RentController from '../controllers/rent'


export default (app) => {
    const rentController = new RentController(app.datasource.models, 'rent')

    setDefaultRoutes(app, rentController, 'alugueis')
}
