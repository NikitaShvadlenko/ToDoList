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

    private lazy var salaryLabel: UILabel = {
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
    public func configureCell(name: String, salary: Double, meetingHours: String) {
        employeeNameLabel.text = name
        configureSalaryLabelText(for: salary)
        managerMeetingHoursLabel.text = meetingHours
    }
}

// MARK: - Private Methods
extension ManagerCell {
    private func setupView() {

        [
            employeeNameLabel,
            salaryLabel,
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
        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(managerMeetingHoursLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
    }

    private func configureSalaryLabelText(for price: Double) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0

        let number = NSNumber(value: price)
        guard let formattedValue = formatter.string(from: number) else { return }

        salaryLabel.text = SharedResources.L10n.roubles(formattedValue)
    }
}
