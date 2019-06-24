import Foundation
import ObjectMapper

class BNKLiveModel: Mappable {
    
    var schedule_id: String?
    var schedule_name: String?
    var schedule_date: String?
    var schedule_detail: String?
    var schedule_time: String?
    var schedule_oshimem: [ScheduleOshiMem]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        schedule_id <- map["schedule_name"]
        schedule_name <- map["schedule_name"]
        schedule_date <- map["schedule_date"]
        schedule_detail <- map["schedule_detail"]
        schedule_time <- map["schedule_time"]
        schedule_oshimem <- map["schedule_oshimem"]
    }
}

class ScheduleOshiMem: Mappable {
    
    var mem_nickname: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        mem_nickname <- map["mem_nickname"]
    }
}
