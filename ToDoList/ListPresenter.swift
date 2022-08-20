import Foundation
import UseCase
import CoreData
import UIKit

class ListPresenter {
    weak var viewController: ListScreenControllerInput?
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

enum AccountantKeys: String {
    case name
    case salary
    case employeeTypeValue
    case deskNumber
    case breakHours
    case accountantTypeValue
}
