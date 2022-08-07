import UIKit
import SnapKit
import SharedResources

final class ListViewController: UIViewController {
    private let mainScreenView = MainScreenView()
    var presenter: ListScreenControllerOutput?

    override func loadView() {
        view = mainScreenView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad(self)
        setupNavigationController()
    }

    func setListDataSource(dataSource: UITableViewDataSource) {
        mainScreenView.dataSource = dataSource
    }

    func setListDelegate(delegate: UITableViewDelegate) {
        mainScreenView.delegate = delegate
    }
}

// MARK: - Private Methods
extension ListViewController {
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
        presenter?.viewDidTapAddEmployeeButton(self)
    }
}

// MARK: - ListControllerInput
extension ListViewController: ListScreenControllerInput {
    func reloadList() {
        mainScreenView.reloadTableView()
    }
}
