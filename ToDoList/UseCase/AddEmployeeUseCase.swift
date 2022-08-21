import UseCase

final class AddEmployeeUseCase: AsyncUseCase<EmployeeRepresentable, Void> {
    private let employeeManager: EmployeeManagerProtocol

    init(employeeManager: EmployeeManagerProtocol) {
        self.employeeManager = employeeManager
    }

    override func executeAsync(_ requestArgument: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void) {
        employeeManager.addEmployee(employee: requestArgument, completion: completion)
    }
}
