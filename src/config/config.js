
const {
    DB_NAME,
    DB_USER,
    DB_PASS,
    DB_HOST
} = process.env

export default {
    database: DB_NAME,
    username: DB_USER,
    password: DB_PASS,
    params: {
        dialect: 'mysql',
        host: DB_HOST,
        define: {
            underscored: true
        }
    },
    jwtSecret: 'API-Locadora',
    jwtSession: { session: true }
}
