let express = require('express')

let bodyParser = require('body-parser')

let router = require('./router')

let globalConfig = require('./config')

const multer=require('multer');

let multerObj = multer({dest: './public/'});

let port = globalConfig.global.server.port

let app = express()

app.use('/',bodyParser.urlencoded({ extended: false }))

app.use('/',(request,response,next)=>{
    response.header("Access-Control-Allow-Origin","*");
    response.header("Access-Control-Allow-Headers","*");
    response.header("Access-Control-Allow-Methods","*");
    next()
})

app.use(multerObj.any());

app.use('/public',express.static('public'))

app.use(router)

app.listen(port,()=>{
    console.log(`服务器在${port}端口启动成功!`)
})