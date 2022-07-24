import UIKit
import SharedResources
import SnapKit

class EmployeeCell: UITableViewCell {

    private lazy var employeeTypeLabel: UILabel = {
        let label = UILabel()
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
    public func setupEmployeeTypeLabel(with text: String) {
        employeeTypeLabel.text = text
    }
}

// MARK: - Private Methods
extension EmployeeCell {
    private func setupView() {
        contentView.addSubview(employeeTypeLabel)
        employeeTypeLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
