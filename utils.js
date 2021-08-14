let crypto = require('crypto');
let utils = {
    splitEntity: (entity) => {
        let propNameList = []
        let propPlaceholderList = []
        let values = []
        let id = -1
        for (let item in entity) {
            if (!entity[item]) {
                continue
            }
            propNameList.push(item)
            propPlaceholderList.push('?')
            values.push(entity[item])
        }

        if ('id' in entity) {
            id = entity['id']
        }

        return [propNameList, propPlaceholderList, values, id]
    },
    productQueryCondition: (entity) => {
        let conditionList = []
        let values = []
        let id = -1
        for (let item in entity) {
            if (!entity[item]) {
                continue
            }
            conditionList.push(item + '=?')
            values.push(entity[item])
        }

        if (entity && 'id' in entity) {
            id = entity['id']
        }

        return [conditionList, values, id]
    },
    passwordMd5(pwd) {
        pwd = pwd ? pwd : '';
        let md5 = crypto.createHash('md5');
        md5.update(pwd);
        let d = md5.digest('hex');
        return d;
    },
    loginVerifyProduct(dao,admin=false) {
        return (req, resp) => {
            let entity = { phone: req.body.phone, password:admin?req.body.password:utils.passwordMd5(req.body.password) }
            console.log(entity)
            dao.query(entity, (err, result) => {
                if (err) {
                    resp.send({
                        success: false,
                        err: '登录异常'
                    })
                }
                else {
                    resp.send({
                        success: result.length != 0,
                        err:result.length != 0?'':'账号或密码有误',
                        entity: result
                    })
                }
            })
        }
    }
}

module.exports = utils