let commentDao = require('../dao/commentDao')

module.exports = {
    children:{
        'query':{
            handle:(req,resp)=>{
                console.log('收到请求')
                commentDao.query(null,(err,result)=>{
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
                let comment = req.body
                commentDao.update(comment,(err,result)=>{
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
                let comment = req.body
                commentDao.delete(comment,(err,result)=>{
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
                let comment = req.body
                commentDao.insert(comment,(err,result)=>{
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