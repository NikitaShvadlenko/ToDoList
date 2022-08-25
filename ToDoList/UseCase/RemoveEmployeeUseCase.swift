import UseCase
import Foundation

final class RemoveEmployeeUseCase: AsyncUseCase<IndexPath, [[EmployeeRepresentable]]> {
    private let employeeManager: EmployeeManagerProtocol

    init(employeeManager: EmployeeManagerProtocol) {
        self.employeeManager = employeeManager
    }

    override func executeAsync(_ requestArgument: IndexPath, completion: @escaping (Result<[[EmployeeRepresentable]], Error>) -> Void) {
        employeeManager.removeEmployee(at: requestArgument, completion: completion)
    }
}
