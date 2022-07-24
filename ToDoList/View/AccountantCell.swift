import UIKit
import SharedResources
import SnapKit

class AccountantCell: UITableViewCell {

    private lazy var employeeNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var employeeSalaryLabel: UILabel = {
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
extension AccountantCell {
    public func setupEmployeeTypeLabel(name: String, salary: Double) {
        employeeNameLabel.text = name
        employeeSalaryLabel.text = String(salary)
    }
}

// MARK: - Private Methods
extension AccountantCell {
    private func setupView() {
        contentView.backgroundColor = .yellow
        contentView.addSubview(employeeNameLabel)
        contentView.addSubview(employeeSalaryLabel)

        employeeNameLabel.snp.makeConstraints { make in
            make.left.bottom.top.equalToSuperview().inset(4)
            make.width.equalToSuperview().multipliedBy(0.5)
        }

        employeeSalaryLabel.snp.makeConstraints { make in
            make.left.equalTo(employeeNameLabel.snp.right)
            make.top.bottom.right.equalToSuperview()
        }
    }
}
