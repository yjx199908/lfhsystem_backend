let diseaseDao = require('../dao/diseaseDao')

module.exports = {
    children:{
        'query':{
            handle:(req,resp)=>{
                diseaseDao.query(null,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'查询失败'
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
        },
        'update':{
            handle:(req,resp)=>{
                let disease = req.body
                diseaseDao.update(disease,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'更新失败'
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
        },
        'delete':{
            handle:(req,resp)=>{
                let disease = req.body
                diseaseDao.delete(disease,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'删除失败'
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
        },
        'insert':{
            handle:(req,resp)=>{
                let disease = req.body
                diseaseDao.insert(disease,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'添加失败'
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