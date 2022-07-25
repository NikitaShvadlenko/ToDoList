import UIKit
import SharedResources
import SnapKit

class EmployeeCell: UITableViewCell {

    private lazy var employeeNameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 25)
        label.minimumScaleFactor = 0.7
        label.textAlignment = .left
        return label
    }()

    private lazy var employeeSalaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var deskNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()

    private lazy var employeeBreakHoursLabel: UILabel = {
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
extension EmployeeCell {
    public func setupEmployeeTypeLabel(name: String, salary: Double, deskNumber: Int, employeeBreakHours: TimePeriod) {
        employeeNameLabel.text = name
        employeeSalaryLabel.text = String(salary)
        deskNumberLabel.text = SharedResources.L10n.deskNumber(deskNumber)
        employeeBreakHoursLabel.text = String(employeeBreakHours.startTime.timeIntervalSinceNow)
    }
}

// MARK: - Private Methods
extension EmployeeCell {
    private func setupView() {
        [
            employeeNameLabel,
            deskNumberLabel,
            employeeBreakHoursLabel,
            employeeSalaryLabel
        ].forEach(contentView.addSubview(_:))
        self.backgroundColor = SharedResources.Asset.Colors.tableViewCellBackgroundColor.color

        employeeNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        deskNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeNameLabel.snp.top)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalTo(employeeNameLabel.snp.trailing)
            make.height.equalTo(20)
        }

        employeeBreakHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeNameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        employeeSalaryLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeBreakHoursLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
            make.bottom.equalToSuperview()
        }
    }
}
