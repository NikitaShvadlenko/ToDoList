import Foundation
import UseCase
import CoreData
import UIKit

class ListPresenter {
    weak var viewController: ListScreenControllerInput?
    var tableViewManager: MainScreenTableViewManager?
    var fetchListUseCase: AsyncUseCase<Void, [[EmployeeRepresentable]]>?
    var addEmployeeUseCase: AsyncUseCase<EmployeeRepresentable, Void>?
    var removeEmployeeUseCase: AsyncUseCase<IndexPath, [[EmployeeRepresentable]]>?
}

extension ListPresenter: ListScreenControllerOutput {

    func viewDidLoad(_ view: ListScreenControllerInput) {
        fetchEmployeeList()
    }

    func viewDidTapAddEmployeeButton(_ view: ListScreenControllerInput) {
        addEmployee(employee: ListProvider().someEmployee())
    }

    func viewDidTapDeleteEmployeeButton(_ view: ListTableViewManagerProtocol, at indexPath: IndexPath) {
        removeEmployee(indexPath: indexPath)
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

    private func addEmployee(employee: EmployeeRepresentable) {
        addEmployeeUseCase?.executeAsync(employee) { [weak self] result in
            switch result {
            case .success:
                self?.fetchEmployeeList()
                print(employee.name)

            case let .failure(error):
                print(error)
            }
        }
    }

    private func removeEmployee(indexPath: IndexPath) {
        removeEmployeeUseCase?.executeAsync(indexPath) { [weak self] result in
            switch result {
            case let .success(employees):
                self?.tableViewManager?.setEmployees(employees)
                self?.viewController?.reloadList()

            case let .failure(error):
                print(error)
            }
        }
    }
}
