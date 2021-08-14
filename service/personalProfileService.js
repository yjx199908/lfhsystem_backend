let doctorDao = require('../dao/doctorDao')
let userDao = require('../dao/userDao')

module.exports = {
    children:{
        
        'u':{
            children:{
                'self':{
                    handle:(req,resp)=>{
                        let user = req.query
                        userDao.query(user,(err,result)=>{
                            if(err){
                                resp.send({
                                    success:false
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
                'uploadAvatar':{
                    handle:(req,resp)=>{
                        console.log('收到请求')
                        if(!req.files || req.files.length == 0){
                            resp.send({success:false})
                        }
                        else{
                            let file = req.files[0]
                            let fileName = file.path
                            
                            resp.send({success:true,avator:fileName})
                        }
                    }
                },
                'updateInfo':{
                    handle:(req,resp)=>{
                        let user = req.body
                        console.log('userBody:',user)
                        userDao.update(user,(err,result)=>{
                            if(err){
                                resp.send({
                                    success:false,
                                    err:'信息更新失败'
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
            
        },
        'd':{
            children:{
                'self':{
                    handle:(req,resp)=>{
                        let doctor = req.query
                        doctorDao.query(doctor,(err,result)=>{
                            if(err){
                                resp.send({
                                    success:false
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
                'uploadAvatar':{
                    handle:(req,resp)=>{
                        console.log('收到请求')
                        if(!req.files || req.files.length == 0){
                            resp.send({success:false})
                        }
                        else{
                            let file = req.files[0]
                            let fileName = file.path
                            
                            resp.send({success:true,avator:fileName})
                        }
                    }
                },
                'updateInfo':{
                    handle:(req,resp)=>{
                        let doctor = req.body
                        doctorDao.update(doctor,(err,result)=>{
                            if(err){
                                resp.send({
                                    success:false,
                                    err:'信息更新失败'
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
    }
}