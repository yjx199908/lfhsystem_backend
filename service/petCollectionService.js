let petDao = require('../dao/petDao')

module.exports = {
    handle:(req,resp)=>{
        petDao.query(null,(err,result)=>{
            if(err){
                resp.send({
                    success:false,
                    err:'查询宠物信息失败'
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