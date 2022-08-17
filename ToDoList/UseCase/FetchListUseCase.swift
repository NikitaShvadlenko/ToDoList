import Foundation
import UseCase

final class FetchListUseCase: AsyncUseCase<Void, [[EmployeeRepresentable]]> {
    private let listProvider: ListProviderProtocol
    private let employeeManager: EmployeeManagerProtocol

    init(listProvider: ListProviderProtocol, employeeManager: EmployeeManagerProtocol) {
        self.listProvider = listProvider
        self.employeeManager = employeeManager
    }

    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[[EmployeeRepresentable]], Error>) -> Void) {
        employeeManager.fetchEmployeeList(from: listProvider, completion: completion)
    }
}
