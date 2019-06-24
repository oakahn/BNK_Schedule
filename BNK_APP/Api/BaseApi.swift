import Foundation
import Alamofire
import ObjectMapper

class BaseApi<Response: BaseMappable> {
    
    init() { }
    
    func postApiObject(_ url: String, parameters: [String: String]?, headers: [String: String]?,
                       completion: @escaping (Response) -> ()
        ) {
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers).responseJSON { (resp) in
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
    
    func getApiObject(_ url: String, parameters: [String: String]?, headers: [String: String]?,
                      completion: @escaping (Response) -> ()
        ) {
        Alamofire.request(url, method: .get, parameters: parameters, headers: headers).responseJSON { (resp) in
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
    
    func postApiArray(_ url: String, parameters: [String: String]?, headers: [String: String]?,
                      completion: @escaping ([Response]) -> ()
        ) {
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers).responseJSON { (resp) in
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
    
    func getApiArray(_ url: String, parameters: [String: String]?, headers: [String: String]?,
                     completion: @escaping ([Response]) -> ()
        ) {
        Alamofire.request(url, method: .get, parameters: parameters, headers: headers).responseJSON { (resp) in
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
