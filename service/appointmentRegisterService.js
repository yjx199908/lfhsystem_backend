let appointmentDao = require('../dao/appointmentDao')
let commentDao = require('../dao/commentDao')

module.exports = {
    children:{
            'getOwnAppointment':{
                handle:(req,resp)=>{
                    let appointment = req.query
                    appointmentDao.query(appointment,(err,result)=>{
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
            'postAppointment':{
                handle:(req,resp)=>{
                    let appointment = req.body
                    appointment.status = 2
                    console.log(appointment)
                    appointmentDao.insert(appointment,(err,result)=>{
                        if(err){
                            console.log(err)
                            resp.send({
                                success:false,
                                err:'预约失败'
                            })
                        }
                        else{
                            resp.send({
                                success:true,
                                entity:{...appointment,id:result.insertId}
                            })
                        }
                    })
                }
            },
            'getComment':{
                handle:(req,resp)=>{
                    let comment = req.query
                    commentDao.query(comment,(err,result)=>{
                        if(err){
                            resp.send({
                                success:false,
                                err:'评论查询失败'
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