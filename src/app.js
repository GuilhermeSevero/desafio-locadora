import express from 'express'
import bodyParser from 'body-parser'
import config from './config/config'

const app = express()

app.config = config

app.set('port', 8080)
app.use(bodyParser.json())

export default app
