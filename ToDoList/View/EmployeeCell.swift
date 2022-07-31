import UIKit
import SharedResources
import SnapKit

class EmployeeCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 25)
        label.minimumScaleFactor = 0.7
        label.textAlignment = .left
        return label
    }()

    private lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var deskNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()

    private lazy var breakHoursLabel: UILabel = {
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
    public func setupEmployeeTypeLabel(name: String, salary: Double, deskNumber: Int, breakHours: String) {
        nameLabel.text = name
        salaryLabel.text = String(salary)
        deskNumberLabel.text = SharedResources.L10n.deskNumber(deskNumber)
        breakHoursLabel.text = breakHours
    }
}

// MARK: - Private Methods
extension EmployeeCell {
    private func setupView() {
        [
            nameLabel,
            deskNumberLabel,
            breakHoursLabel,
            salaryLabel
        ].forEach(contentView.addSubview(_:))
        self.backgroundColor = SharedResources.Asset.Colors.tableViewCellBackgroundColor.color

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        deskNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.top)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalTo(nameLabel.snp.trailing)
            make.height.equalTo(20)
        }

        breakHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        salaryLabel.snp.makeConstraints { make in
            make.top.equalTo(breakHoursLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
            make.bottom.equalToSuperview()
        }
    }
}
