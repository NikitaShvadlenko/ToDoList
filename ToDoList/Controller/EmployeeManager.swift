import Foundation

protocol EmployeeManagerProtocol {
    func fetchEmployeeData(from provider: EmployeeProvider)
    func addEmployee(employee: Employee)
    func removeEmployee(employee: Employee)
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
        fetchEmployeeData(from: employeeDataProvider)
        addEmployee(employee: Accountant(name: "cwdc", salary: 100500, breakHours: TimePeriod(startTime: Date(), finishTime: Date()), deskNumber: 12, accountantType: .inventory))
        addEmployee(employee: BasicWorker(name: "de", salary: 300, breakHours: TimePeriod(startTime: Date(), finishTime: Date()), deskNumber: 11))
        addEmployee(employee: Manager(name: "dwd", salary: 3000, meetingHours: TimePeriod(startTime: Date(), finishTime: Date())))
    }
}

// MARK: EmployeeManagerProtocol
extension EmployeeManager: EmployeeManagerProtocol {
    func addEmployee(employee: Employee) {
        updateEmployeeList(with: employee)
    }

    func removeEmployee(employee: Employee) {
    }

    func fetchEmployeeData(from provider: EmployeeProvider) {
        self.employees = provider.fetchEmployeeData()

        for employeeType in employees {
            for employee in employeeType {
                updateEmployeeList(with: employee)
            }
        }
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
