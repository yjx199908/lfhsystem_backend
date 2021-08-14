let pool = require('./pool')

module.exports = class TransactionManager{
    constructor(){
        this.con = pool.borrowConn()
    }

    excuteTask(section){
        this.con.beginTransaction(err=>{
            if(err){
                section({success:false,err:'开启事务失败'})
                pool.repayConn(this.con)
            }
            else{
                try{
                    section({success:true,con:this.con})
                    this.con.commit()
                }
                catch(e){
                    console.log(e)
                    this.con.rollback()
                }
                finally{
                    pool.repayConn(this.con)
                }
            }
            
        })
    }

    reburn(){
        this.con = pool.borrowConn()
    }
    
}