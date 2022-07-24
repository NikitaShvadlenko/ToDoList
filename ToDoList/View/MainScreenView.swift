import UIKit
import SnapKit

class MainScreenView: UIView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 100
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "\(EmployeeCell.self)")
        tableView.register(ManagerCell.self, forCellReuseIdentifier: "\(ManagerCell.self)")
        tableView.register(AccountantCell.self, forCellReuseIdentifier: "\(AccountantCell.self)")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension MainScreenView {
    var dataSource: UITableViewDataSource? {
        get {
            tableView.dataSource
        }
        set {
            tableView.dataSource = newValue
        }
    }
}

// MARK: - Private Methods
extension MainScreenView {
    private func setupView() {
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
