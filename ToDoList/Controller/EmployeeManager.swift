import Foundation

protocol EmployeeManagerProtocol {
    func addEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void)
    func removeEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void)
    func updateEmployeeList(with employee: EmployeeRepresentable)
    func fetchEmployeeList(from listProvider: ListProviderProtocol)
}

class EmployeeManager: NSObject {
    let employeeDataProvider = ListProvider()

    var employees: [[EmployeeRepresentable]] = []

    private var accountants: [AccountantRepresentable] = []
    private var managers: [ManagerRepresentable] = []
    private var basicWorkers: [BasicWorkerRepresentable] = []

    override init() {
        super.init()
    }
}

// MARK: EmployeeManagerProtocol
extension EmployeeManager: EmployeeManagerProtocol {

    func fetchEmployeeList(from listProvider: ListProviderProtocol) {
        listProvider.fetchEmployeeData { result in
            switch result {

            case let .success(employees):
                self.employees = employees

            case let .failure(error):
                print(error)
            }
        }
    }

    func addEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void) {
        updateEmployeeList(with: employee)
        completion(.success(Void()))
    }

    func removeEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void) {
        switch employee.employeeType {

        case .management:
            self.managers = self.managers.filter { $0 !== employee }

        case .accountant:
            self.accountants = self.accountants.filter { $0 !== employee }

        case .basicWorker:
            self.basicWorkers = self.basicWorkers.filter { $0 !== employee }
        }

        employees = [managers, accountants, basicWorkers]

        completion(.success(Void()))
    }

    func updateEmployeeList(with employee: EmployeeRepresentable) {

        switch employee.employeeType {

        case .management:
            guard let manager = employee as? ManagerRepresentable else { return }
            managers.append(manager)

        case .accountant:
            guard let accountant = employee as? AccountantRepresentable else { return }
            accountants.append(accountant)

        case .basicWorker:
            guard let basicWorker = employee as? BasicWorkerRepresentable else { return }
            basicWorkers.append(basicWorker)
        }

        employees = [managers, basicWorkers, accountants]
    }
}
