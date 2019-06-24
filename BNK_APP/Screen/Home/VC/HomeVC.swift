import UIKit

protocol HomeVCProtocol {
    func getDataForTableViewCell(data: [ScheduleModel])
}

class HomeVC: BaseVC {
    
    @IBOutlet weak var scheduleTableView: UITableView!
    lazy var presenter = HomePresenter(self)
    var scheduleModel: [ScheduleModel]?
    
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
    }
}

extension HomeVC: HomeVCProtocol {
    func getDataForTableViewCell(data: [ScheduleModel]) {
        scheduleModel = data
        scheduleTableView.reloadData()
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let table = tableView.dequeueReusableCell(withIdentifier: "index", for: indexPath) as? ScheduleViewCell else {
            return UITableViewCell()
        }
        table.nameLabel.text = scheduleModel?[indexPath.row].schedule_oshimem?[0].mem_nickname
        table.dataLabel.text = scheduleModel?[indexPath.row].schedule_date
        return table
    }
}
