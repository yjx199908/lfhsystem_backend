let pool = require('../pool')
let {splitEntity,productQueryCondition} = require('../utils')

module.exports = (tableName)=>{

    return{
        insert:(entity,callback,con)=>{
            let autoCommit = true
            let [propNameList,propPlaceholderList,values,id] = splitEntity(entity)
            let sql = `insert into ${tableName}(${propNameList.join(',')}) values(${propPlaceholderList.join(',')})`
            con?autoCommit = false:(con = pool.borrowConn())

            con.query(sql,values,(err,result)=>{
                callback(err,result)
                autoCommit?pool.repayConn(con):''
            })
        },
        query:(entity,callback,con)=>{
            let autoCommit = true
            let [conditionList,values,id] = productQueryCondition(entity)
            console.log(conditionList)
            let sql = `select * from ${tableName} ${conditionList.length > 0?'where':''} ${conditionList.join(' and ')}`
            console.log(sql)
            con?(autoCommit = false):(con = pool.borrowConn())
            con.query(sql,values,(err,result)=>{
                callback(err,result)
                autoCommit?pool.repayConn(con):''
            })
        },
        queryCustomization(rules,callback,con){
            let autoCommit = true
            con?(autoCommit=false):(con = pool.borrowConn())
            let values = []
            let conditionStr = rules.map(e=>{
                values.push(e.value)
                return `${e.prop}${e.oper}?`
            }).join(' and ')

            let sql = `select * from ${tableName} ${conditionStr.length == 0?'':'where'} ${conditionStr}`

            con.query(sql,values,(err,result)=>{
                callback(err,result)
                autoCommit?pool.repayConn(con):''
            })
        },
        update:(entity,callback,con)=>{
            let autoCommit = true
            let [conditionList,values,id] = productQueryCondition(entity)
            let sql = `update ${tableName} set ${conditionList.join(',')} where id=?`
            con?autoCommit=false:(con = pool.borrowConn())
            con.query(sql,[...values,id],(err,result)=>{
                callback(err,result)
                autoCommit?pool.repayConn(con):''
            })
        },
        delete:(entity,callback,con)=>{
            let autoCommit = true
            let [conditionList,values,id] = productQueryCondition(entity)
            let sql = null
            if(id){
                sql = `delete from ${tableName} where id=${id}`
            }
            else{
                sql = `delete from ${tableName} ${conditionList.length > 0?'where':''} ${conditionList.join(' and ')}`
            }
            con?autoCommit=false:(con = pool.borrowConn())
            con.query(sql,values,(err,result)=>{
                callback(err,result)
                autoCommit?pool.repayConn(con):''
            })
        },
        customExecute:(sql,values,callback,con)=>{
            let autoCommit = true
            con?autoCommit=false:(con = pool.borrowConn())
            con.query(sql,values,(err,result)=>{
                callback(err,result)
                autoCommit?pool.repayConn(con):''
            })
        }
    }
}


