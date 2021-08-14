let leaveMessageDao = require('../dao/leaveMessageDao')

module.exports = {
    children:{
        'query':{
            handle:(req,resp)=>{
                leaveMessageDao.query(null,(err,result)=>{
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
                let leaveMessage = req.body
                leaveMessageDao.update(leaveMessage,(err,result)=>{
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
                let leaveMessage = req.body
                leaveMessageDao.delete(leaveMessage,(err,result)=>{
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
                let leaveMessage = req.body
                leaveMessageDao.insert(leaveMessage,(err,result)=>{
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