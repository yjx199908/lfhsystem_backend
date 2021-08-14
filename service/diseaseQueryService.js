let diseaseDao = require('../dao/diseaseDao')

module.exports = {
    children:{
        'getAll':{
            handle:(req,resp)=>{
                let disease = req.query
                diseaseDao.query(disease,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'疾病查询失败'
                        })
                    }
                    else{
                        resp.send({
                            success:true,
                            entity:result
                        })
                    }
                })
            }
        }
    }
}