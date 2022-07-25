import UIKit
import SharedResources
import SnapKit

class ManagerCell: UITableViewCell {

    private lazy var employeeNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 25)
        label.minimumScaleFactor = 0.4
        return label
    }()

    private lazy var employeeSalaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var managerMeetingHoursLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Public Methods
extension ManagerCell {
    public func configureCell(name: String, salary: Double, meetingHours: TimePeriod) {
        employeeNameLabel.text = name
        employeeSalaryLabel.text = String(salary)
        managerMeetingHoursLabel.text = String(meetingHours.startTime.timeIntervalSinceNow)
    }
}

// MARK: - Private Methods
extension ManagerCell {
    private func setupView() {

        [
            employeeNameLabel,
            employeeSalaryLabel,
            managerMeetingHoursLabel
        ].forEach(contentView.addSubview(_:))
        self.backgroundColor = SharedResources.Asset.Colors.tableViewCellBackgroundColor.color

        employeeNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        managerMeetingHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeNameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        employeeSalaryLabel.snp.makeConstraints { make in
            make.top.equalTo(managerMeetingHoursLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
    }
}
