let leaveMessageDao = require('../dao/leaveMessageDao')

module.exports = {
    handle:(req,resp)=>{
        let leaveMessage = req.body
        leaveMessageDao.insert(leaveMessage,(err,result)=>{
            if(err){
                resp.send({
                    success:false,
                    err:'留言失败'
                })
            }
            else{
                resp.send({
                    success:true,
                    entity:{...leaveMessage,id:result.insertId}
                })
            }
        })
    }
}