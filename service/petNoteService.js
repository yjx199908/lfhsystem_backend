let noteDao = require('../dao/noteDao')

module.exports = {
    children:{
        'getAll':{
            handle:(req,resp)=>{
                let note = req.body
                noteDao.query(note,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'查询笔记失败'
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
        'addNote':{
            handle:(req,resp)=>{
                let note = req.body
                noteDao.insert(note,(err,result)=>{
                    if(err){
                        console.log(err)
                        resp.send({
                            success:false,
                            err:'添加笔记失败'
                        })
                    }
                    else{
                        resp.send({
                            success:true,
                            entity:{...note,id:result.insertId}
                        })
                    }
                })
            }
        }
    }
}