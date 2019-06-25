import Foundation
import Alamofire
import ObjectMapper

class BaseApi<Response: BaseMappable> {
    
    init() { }
    
    func apiObject(_ url: String, method: HTTPMethod, parameters: [String: String]?, headers: [String: String]?,
                      completion: @escaping (Response) -> ()
        ) {
        Alamofire.request(url, method: method, parameters: parameters, headers: headers).responseJSON { (resp) in
            guard let statusCode = resp.response?.statusCode else { return }
            switch statusCode {
            case 200:
                guard let res = resp.result.value as? NSObject else { return }
                guard let detail = Mapper<Response>().map(JSONObject: res) else { return }
                completion(detail)
                
            default:
                fatalError("received non-dictionary JSON response")
            }
        }
    }
    
    func apiArray(_ url: String, method: HTTPMethod, parameters: [String: String]?, headers: [String: String]?,
                      completion: @escaping ([Response]) -> ()
        ) {
        Alamofire.request(url, method: method, parameters: parameters, headers: headers).responseJSON { (resp) in
            guard let statusCode = resp.response?.statusCode else { return }
            switch statusCode {
            case 200:
                guard let res = resp.result.value as? NSObject else { return }
                guard let detail = Mapper<Response>().mapArray(JSONObject: res) else { return }
                completion(detail)
                
            default:
                fatalError("received non-dictionary JSON response")
            }
        }
    }
}
