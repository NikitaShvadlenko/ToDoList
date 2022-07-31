import UIKit
import SnapKit
import SharedResources

class AccountantCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
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

    private lazy var accountantTypeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .italicSystemFont(ofSize: 16)
        return label
    }()

    private lazy var breakHoursLabel: UILabel = {
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
        breakHours: String
    ) {
        nameLabel.text = name
        configureSalaryLabelText(for: salary)
        accountantTypeLabel.text = accountantType
        deskNumberLabel.text = SharedResources.L10n.deskNumber(deskNumber)
        breakHoursLabel.text = breakHours
    }
}

// MARK: - Private Methods
extension AccountantCell {
    private func setupView() {
        [
            nameLabel,
            accountantTypeLabel,
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

        accountantTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }

        deskNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.top)
            make.leading.equalTo(nameLabel.snp.trailing).offset(4)
            make.trailing.equalToSuperview().inset(4)
            make.height.equalTo(20)
        }

        breakHoursLabel.snp.makeConstraints { make in
            make.top.equalTo(accountantTypeLabel.snp.bottom).offset(4)
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
