let userDao = require('../dao/userDao')
let doctorDao = require('../dao/doctorDao')
let adminDao = require('../dao/adminDao')
let {loginVerifyProduct} = require('../utils')
module.exports = {
    children:{
        'u':{
            handle:loginVerifyProduct(userDao)
        },
        'a':{
            handle:loginVerifyProduct(adminDao,true)
        },
        'd':{
            handle:loginVerifyProduct(doctorDao)
        }
    }
}