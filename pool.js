let mysql=require('mysql');

let {host,port,user,password,dbname,oriConnCount,minConnCount,maxConnCount,serverTimezone} = require('./config').global.db

let createConnection = ()=>{
    let connection=mysql.createConnection({
        host:host,
        port:port,
        user:user,
        password:password,
        database:dbname
    }); 
    return connection;
}

class Pool{
    constructor(){
        this.conns = []
        for(let i = 0;i < oriConnCount;++i){
            let connection = createConnection()
            connection.connect()
            this.conns.push(connection)
        }
    }

    createConnection(){
        for(let i = this.conns.length;i < maxConnCount;++i){
            let connection = createConnection()
            connection.connect()
            this.conns.push(connection)
        }
    }

    borrowConn(){
        if(this.conns.length < minConnCount){
            setTimeout(()=>{
                this.createConnection()
            },0)
        }
        let connection = this.conns.pop()
        connection.self_name = new Date().getTime()
        return connection
    }

    repayConn(connection){
        if(this.conns.length >= maxConnCount){
            connection.end()
            return
        }
        this.conns.push(connection)
    }   

    distroy(){
        setTimeout(()=>{
            for(let i = 0;i < this.conns.length;++i){
                this.conns[i].end()
            }
        })
    }
}

let pool = new Pool()

module.exports = pool

