let userDao = require('../dao/userDao')
let doctorDao = require('../dao/doctorDao')

let {passwordMd5} = require('../utils');
//没有子路由时children一定要null
module.exports = {
    children: {
        'u': {
            handle: (req, resp) => {
                console.log(req.body)
                let user = {...(req.body),password:passwordMd5(req.body.password)}
                console.log(user)
                userDao.insert(user, (err, result) => {
                    if (err) {
                        console.log(err)
                        resp.send({
                            success: false,
                            err: '数据插入失败!'
                        })
                    }
                    else {
                        resp.send({
                            success: true,
                            data: {
                                insertId: result.insertId,
                                entity: { ...user, id: result.insertId }
                            }
                        })
                    }
                })
            }
        },
        'd':{
            handle:(req,resp)=>{
                let doctor = {...(req.body),password:passwordMd5(req.body.password)}
                doctorDao.insert(doctor,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'醫生信息注冊失敗'
                        })
                    }
                    else{
                        resp.send({
                            success:true,
                            data:{
                                insertId:result.insertId,
                                entity:{...doctor,id:result.insertId}
                            }
                        })
                    }
                })
            }
        }
    }
}