let chatItemDao = require('../dao/chatItemDao')
let customExecute = require('../dao/customExecute')

module.exports = {
    children:{
        'sendMsg':{
            handle:(req,resp)=>{
                let chatItem = req.body
                chatItem.sourceId = 'u' + chatItem.sourceId
                chatItem.targetId = 'd' + chatItem.targetId
                chatItemDao.insert(chatItem,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:err
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
        'readMsg':{
            handle:(req,resp)=>{
                let chatItem = req.query
                console.log(chatItem)
                chatItem.targetId = 'u' + chatItem.targetId
                chatItem.sourceId = 'd' + chatItem.sourceId
                customExecute(`select *,(select avator from doctor where id = substring(c.sourceId,2)) as avator from chat_item c where sourceId=? and targetId=? and alreadyRead=0`,[chatItem.sourceId,chatItem.targetId],(err,result)=>{
                    if(err){
                        console.log(err)
                        resp.send({
                            success:false,
                            err:'查询聊天记录失败'
                        })
                    }
                    else{
                        let chats = result
                        console.log(chatItem)
                        customExecute('update chat_item set alreadyRead = 1 where sourceId=? and targetId=?',[chatItem.sourceId,chatItem.targetId],(err,result)=>{
                            if(err){
                                resp.send({
                                    success:false,
                                    err:'更新聊天状态失败'
                                })
                            }
                            else{
                                console.log(chats)
                                chats = chats.map(chat=>{
                                    chat.model = 'target'
                                    return chat
                                })
                                resp.send({
                                    success:true,
                                    entity:chats
                                })
                            }
                        })
                    }
                })
                
            }
        },
        'listenCount':{
            handle:(req,resp)=>{
                let targetId = 'u' + req.query.targetId
                customExecute(`select d.id as doctorId,d.name as doctorName,h.name as hospitalName,coun,d.avator as doctorAvator from (select count(*) as coun,substring(sourceId,2) as sId from chat_item where alreadyRead = 0 and targetId=? group by sourceId) s inner join doctor d on s.sId = d.id inner join hospital h on d.hospitalId = h.id`,[targetId],(err,res)=>{
                    if(err){
                        console.log(err)
                       resp.send({
                           success:false,
                           err:'数据获取失败'
                       }) 
                    }
                    else{
                        resp.send({
                            success:true,
                            entity:res
                        })
                    }
                })
            }

        }
    }
}