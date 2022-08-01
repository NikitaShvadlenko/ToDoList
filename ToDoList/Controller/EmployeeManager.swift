import Foundation

protocol EmployeeManagerProtocol {
    func fetchEmployeeData(from provider: EmployeeProvider, completion: @escaping (Result<Void, Error>) -> Void)
    func addEmployee(employee: Employee, completion: @escaping (Result<Void, Error>) -> Void)
    func removeEmployee(employee: Employee, completion: @escaping (Result<Void, Error>) -> Void)
    func updateEmployeeList(with employee: Employee)
}

class EmployeeManager: NSObject {
    let employeeDataProvider = EmployeeProvider()

    var employees: [[Employee]] = []

    private var accountants: [Accountant] = []
    private var managers: [Manager] = []
    private var basicWorkers: [BasicWorker] = []

    override init() {
        super.init()
    }
}

// MARK: EmployeeManagerProtocol
extension EmployeeManager: EmployeeManagerProtocol {
    func addEmployee(employee: Employee, completion: @escaping (Result<Void, Error>) -> Void) {
        updateEmployeeList(with: employee)
        completion(.success(Void()))
    }

    func removeEmployee(employee: Employee, completion: @escaping (Result<Void, Error>) -> Void) {
        switch employee.employeeType {

        case .management:
            self.managers = self.managers.filter { $0 != employee }

        case .accountant:
            self.accountants = self.accountants.filter { $0 != employee }

        case .basicWorker:
            self.basicWorkers = self.basicWorkers.filter { $0 != employee }
        }

        employees = [managers, basicWorkers, accountants]

        completion(.success(Void()))
    }

    func fetchEmployeeData(from provider: EmployeeProvider, completion: @escaping (Result<Void, Error>) -> Void) {
        self.employees = provider.fetchEmployeeData()

        for employeeType in employees {
            for employee in employeeType {
                updateEmployeeList(with: employee)
            }
        }
        completion(.success(Void()))
    }

    func updateEmployeeList(with employee: Employee) {

        switch employee.employeeType {

        case .management:
            guard let manager = employee as? Manager else { return }
            managers.append(manager)

        case .accountant:
            guard let accountant = employee as? Accountant else { return }
            accountants.append(accountant)

        case .basicWorker:
            guard let basicWorker = employee as? BasicWorker else { return }
            basicWorkers.append(basicWorker)
        }

        employees = [managers, basicWorkers, accountants]
    }
}
