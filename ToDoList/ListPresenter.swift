import Foundation

class ListPresenter {
   weak var viewController: ListScreenControllerInput?

    var tableViewManager: MainScreenTableViewManager?
}

extension ListPresenter: ListScreenControllerOutput {
    func viewDidLoad(_ view: ListScreenControllerInput) {
        fetchEmployeeList()
        view.reloadList()
    }

    func viewDidTapAddEmployeeButton(_ view: ListScreenControllerInput) {
        print("Tapped Employee Button")
        viewController?.reloadList()
    }
}

// MARK: - Private Methods
extension ListPresenter {
    private func fetchEmployeeList() {
        tableViewManager?.setEmployees(EmployeeManager().employees)
    }
}
