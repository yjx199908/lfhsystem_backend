let express = require('express')

let router = express.Router()

let routeMap = {
    'register':require('./service/registerService'),
    'login':require('./service/loginService'),
    'share':require('./service/shareService'),
    'appointmentRegister':require('./service/appointmentRegisterService'),
    'diseaseQuery':require('./service/diseaseQueryService'),
    'expertInterrogation':require('./service/expertInterrogationService'),
    'interrogationFeedBack':require('./service/interrogationFeedBackService'),
    'petCollection':require('./service/petCollectionService'),
    'petNote':require('./service/petNoteService'),
    'leaveMessage':require('./service/leaveMessageService'),
    'personalProfile':require('./service/personalProfileService'),
    'appointmentList':require('./service/appointmentListService'),
    'interrogationShow':require('./service/interrogationShowService'),
    'appointmentAdmin':require('./service/appointmentAdminSerivce'),
    'collectionAdmin':require('./service/collectionAdminService'),
    'commentAdmin':require('./service/commentAdminService'),
    'diseaseAdmin':require('./service/diseaseAdminService'),
    'doctorAdmin':require('./service/doctorAdminService'),
    'hospitalAdmin':require('./service/hospitalAdminService'),
    'messageAdmin':require('./service/messageAdminService'),
    'userAdmin':require('./service/userAdminService')
}

function bindRoute(routeMap,prePath){
    for(let item in routeMap){
        prePath.push(item)
        if('children' in routeMap[item] && routeMap[item].children){
            bindRoute(routeMap[item].children,prePath)
        }
        else{
            console.log(`/${prePath.join('/')}`,routeMap[item])
            router.use(`/${prePath.join('/')}`,routeMap[item].handle)
        }
        prePath.pop()
    }
}

bindRoute(routeMap,[])

module.exports = router