import Foundation
import UseCase

final class FetchListFromCoreDataUseCase: AsyncUseCase<Void, [[EmployeeRepresentable]]> {
    private let employeeManager: EmployeeManagerProtocol

    init(employeeManager: EmployeeManagerProtocol) {
        self.employeeManager = employeeManager
    }

    override func executeAsync(_ requestArgument: Void, completion: @escaping (Result<[[EmployeeRepresentable]], Error>) -> Void) {
        employeeManager.fetchFromCoreData(completion: completion)
    }
}
