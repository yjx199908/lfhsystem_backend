let appointmentDao = require('../dao/appointmentDao')
let customExecute = require('../dao/customExecute')

module.exports = {
    children:{
        'getAll':{
            handle:(req,resp)=>{
                let appointment = req.query
                console.log(appointment)
                customExecute(`select *,a.id as aId from appointment a inner join user u where a.userId = u.id and a.doctorId=?`,[appointment.doctorId],(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'查询预约信息失败'
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
        'responseAppointment':{
            handle:(req,resp)=>{
                let appointment = req.body
                appointmentDao.update(appointment,(err,result)=>{
                    if(err){
                        console.log(err)
                        resp.send({
                            success:false,
                            err:'操作失败'
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