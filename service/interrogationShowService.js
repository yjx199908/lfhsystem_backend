let chatItemDao = require('../dao/chatItemDao')
let customExecute = require('../dao/customExecute')

module.exports = {
    children:{
        'sendMsg':{
            handle:(req,resp)=>{
                let chatItem = req.body
                chatItem.sourceId = 'd' + chatItem.sourceId
                chatItem.targetId = 'u' + chatItem.targetId
                chatItemDao.insert(chatItem,(err,result)=>{
                    if(err){
                        resp.send({
                            success:false,
                            err:'发送信息失败'
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
                chatItem.targetId = 'd' + chatItem.targetId
                chatItem.sourceId = 'u' + chatItem.sourceId
                customExecute(`select *,(select avator from user where id = substring(c.sourceId,2)) avator from chat_item c where sourceId=? and targetId=? and alreadyRead=0`,[chatItem.sourceId,chatItem.targetId],(err,result)=>{
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
                let targetId = 'd' + req.query.targetId
                customExecute(`select u.id as userId,u.name as userName,coun,u.avator as userAvator from (select count(*) as coun,substring(sourceId,2) as sId from chat_item where alreadyRead = 0 and targetId=? group by sourceId) s inner join user u on s.sId = u.id`,[targetId],(err,res)=>{
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