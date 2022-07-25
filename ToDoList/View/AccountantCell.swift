import UIKit
import SnapKit
import SharedResources

class AccountantCell: UITableViewCell {

    private lazy var employeeNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 25)
        label.minimumScaleFactor = 0.7
        return label
    }()

    private lazy var employeeSalaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var accountantTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 16)
        return label
    }()

    private lazy var accountantBreakHoursLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var deskNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
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
extension AccountantCell {
    public func configureCell(
        name: String,
        salary: Double,
        accountantType: String,
        deskNumber: Int,
        breakHours: TimePeriod
    ) {
        employeeNameLabel.text = name
        employeeSalaryLabel.text = String(salary)
        accountantTypeLabel.text = accountantType
        deskNumberLabel.text = SharedResources.L10n.deskNumber(deskNumber)
        accountantBreakHoursLabel.text = String(breakHours.startTime.timeIntervalSinceNow)
    }
}

// MARK: - Private Methods
extension AccountantCell {
    private func setupView() {
        [
            employeeNameLabel,
            accountantTypeLabel,
            deskNumberLabel,
            accountantBreakHoursLabel,
            employeeSalaryLabel
        ].forEach(contentView.addSubview(_:))

        employeeNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        accountantTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeNameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        deskNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeNameLabel.snp.top)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        accountantBreakHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(accountantTypeLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        employeeSalaryLabel.snp.makeConstraints { make in
            make.top.equalTo(accountantBreakHoursLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
            make.bottom.equalToSuperview()
        }
    }
}
