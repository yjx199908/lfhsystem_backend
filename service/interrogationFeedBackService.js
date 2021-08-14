let commentDao = require('../dao/commentDao')

module.exports = {
    handle:(req,resp)=>{
        let comment = req.body
        commentDao.insert(comment,(err,result)=>{
            if(err){
                console.log(err)
                resp.send({
                    success:false,
                    err:'评论失败'
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