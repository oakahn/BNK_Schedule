import UIKit

protocol ScheduleVCProtocol: BaseVCProtocol {
    func getDataForTableViewCell(data: [ScheduleModel])
}

class ScheduleVC: BaseVC {
    
    @IBOutlet weak var scheduleTableView: UITableView!
    lazy var presenter = SchedulePresenter(self)
    var scheduleModel: [ScheduleModel]?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.callScheduleService()
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setup() {
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
}

extension ScheduleVC: ScheduleVCProtocol {
    func getDataForTableViewCell(data: [ScheduleModel]) {
        scheduleModel = data
        scheduleTableView.reloadData()
    }
}

extension ScheduleVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let table = tableView.dequeueReusableCell(withIdentifier: "index", for: indexPath) as? ScheduleViewCell else {
            return UITableViewCell()
        }
        table.nameLabel.text = scheduleModel?[indexPath.row].schedule_oshimem?[0].mem_nickname
        table.dataLabel.text = scheduleModel?[indexPath.row].schedule_date
        table.timeLabel.text = scheduleModel?[indexPath.row].schedule_time
        
        return table
    }
}
