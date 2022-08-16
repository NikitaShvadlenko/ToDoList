import Foundation
import UseCase
import CoreData

class ListPresenter {
   weak var viewController: ListScreenControllerInput?

    var employeeRepository: EmployeeManagerProtocol?
    var employeeStorage: EmployeeStorageProtocol?
    var tableViewManager: MainScreenTableViewManager?
    var fetchListUseCase: AsyncUseCase<Void, [[EmployeeRepresentable]]>?
}

extension ListPresenter: ListScreenControllerOutput {
    func viewDidLoad(_ view: ListScreenControllerInput) {
        fetchEmployeeList()
    }

    func viewDidTapAddEmployeeButton(_ view: ListScreenControllerInput) {
        print("Tapped Employee Button")
    }
}

// MARK: - Private Methods
extension ListPresenter {
    private func fetchEmployeeList() {
        fetchListUseCase?.executeAsync { [weak self] result in
            switch result {
            case let .success(employees):
                self?.tableViewManager?.setEmployees(employees)
                self?.viewController?.reloadList()

            case let.failure(error):
                print(error)
            }
        }
    }
}
