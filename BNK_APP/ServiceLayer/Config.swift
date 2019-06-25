import Foundation
import Alamofire

class GetScheduleConfig {
    
    var method: HTTPMethod = .post
    
    let url = "https://www.bnk48.com/model/scheduleClassdb/scheduleAjax.php"
    
    let headers: [String: String] = ["Cookie": "_ga=GA1.2.1181367172.1556090132; PHPSESSID=s2nmq8j8q5cu8a7a1b6crlbqoo; _gid=GA1.2.1156600405.1561013558"]
    
    let parameter: [String: String] = ["month": "",
                                       "Setype": "5",
                                       "SeMem": "4,5,9,12,21",
                                       "method": "DateEvent"]
}
