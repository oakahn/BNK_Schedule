import Foundation
import ObjectMapper

struct TestModel: Codable {
    var schedule_id: String?
    var schedule_name: String?
    var schedule_date: String?
    var schedule_detail: String?
    var schedule_oshimem: [OshiModel]?
}

struct OshiModel: Codable {
    var mem_nickname: String?
}

protocol SchedulePresenterProtocol {
    func callScheduleService()
}

class SchedulePresenter {
    var view: ScheduleVCProtocol?
    private let getScheduleservice = GetScheduleService()
    var testModel: [TestModel] = []
    
    init(_ view: ScheduleVCProtocol) {
        self.view = view
        //        mockData()
    }
    
    private func mockData() {
        for _ in 0..<10 {
            testModel.append(
                TestModel(schedule_id: "1274", schedule_name: "Cherprang Live", schedule_date: "2019-06-01", schedule_detail: "afternoon", schedule_oshimem: [OshiModel(mem_nickname: "CHERPRANG")])
            )
        }
    }
}

extension SchedulePresenter: SchedulePresenterProtocol {
    
    func callScheduleService() {
        getScheduleservice.call { (resp) in
            self.view?.getDataForTableViewCell(data: resp)
        }
        //        let jsonEncoder = JSONEncoder()
        //
        //        guard let jsonData = try? jsonEncoder.encode(testModel) else { return }
        //
        //        guard let json = String(data: jsonData, encoding: String.Encoding.utf8) else { return }
        //
        //        guard let detail = Mapper<ScheduleModel>().mapArray(JSONString: json) else { return }
        
        //        view?.getDataForTableViewCell(data: detail)
    }
}
