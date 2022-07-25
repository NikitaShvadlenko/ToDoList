import SnapKit
import UIKit

class HeaderView: UIView {
    private lazy var employeeTypeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var employeeTypeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: Public Methods
extension HeaderView {
    public func configureHeader(title: String, icon: UIImage) {
        employeeTypeImageView.image = icon
        employeeTypeLabel.text = title
    }
}

// MARK: Private Methods
extension HeaderView {
    private func setupView() {
        self.addSubview(employeeTypeLabel)
        self.addSubview(employeeTypeImageView)

        employeeTypeImageView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(4)
            make.width.equalTo(employeeTypeLabel.snp.height)
        }
        employeeTypeLabel.snp.makeConstraints { make in
            make.left.equalTo(employeeTypeImageView.snp.right).offset(10)
            make.right.bottom.equalToSuperview().inset(4)
            make.height.equalTo(employeeTypeImageView.snp.height)
        }
    }
}
