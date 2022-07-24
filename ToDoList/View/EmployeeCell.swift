import UIKit
import SharedResources
import SnapKit

class EmployeeCell: UITableViewCell {

    private lazy var employeeNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    private lazy var employeeDescriptionLabel: UILabel = {
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
    public func setupEmployeeTypeLabel(name: String, description: String) {
        employeeNameLabel.text = name
        employeeDescriptionLabel.text = description
    }
}

// MARK: - Private Methods
extension EmployeeCell {
    private func setupView() {
        contentView.addSubview(employeeNameLabel)
        contentView.addSubview(employeeDescriptionLabel)

        employeeNameLabel.snp.makeConstraints { make in
            make.left.bottom.top.equalToSuperview().inset(4)
            make.width.equalToSuperview().multipliedBy(0.5)
        }

        employeeDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(employeeNameLabel.snp.right)
            make.top.bottom.right.equalToSuperview()
        }
    }
}
