import UIKit
import SnapKit
import SharedResources

class ViewController: UIViewController {

    private let mainScreenView = MainScreenView()
    private let mainScreenManager = MainScreenTableViewManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationController()
        mainScreenView.dataSource = mainScreenManager
        mainScreenView.delegate = mainScreenManager
    }
}

// MARK: - Private Methods
extension ViewController {
    private func setupView() {
        title = SharedResources.L10n.employeeScreenName
        view.addSubview(mainScreenView)
        mainScreenView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupNavigationController() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(sfSymbol: SFSymbol.addEmployee),
            style: .plain,
            target: self,
            action: #selector(didTapAddItem)
        )

        navigationItem.rightBarButtonItem?.tintColor = Asset.Colors.employeeColor.color

    }

    @objc
    func didTapAddItem() {
        print("did tap")
    }
}
