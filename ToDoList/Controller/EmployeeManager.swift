import Foundation

protocol EmployeeManagerProtocol {
    func fetchEmployeeData(from provider: EmployeeProvider)
    func addEmployee(employee: Employee)
    func removeEmployee(employee: Employee)
}

class EmployeeManager: NSObject {
    var employees: [[Employee]] = []
//    var accountants: [Accountant] = []
//    var managers: [Manager] = []
//    var basicWorker: [BasicWorker] = []

    override init() {
        let employeeDataProvider = EmployeeProvider()
        employees = employeeDataProvider.fetchEmployeeData()
        super.init()
        addEmployee(employee: Accountant(name: "cwdc", salary: 100500, breakHours: TimePeriod(startTime: Date(), finishTime: Date()), deskNumber: 12, accountantType: .inventory))
        addEmployee(employee: BasicWorker(name: "de", salary: 300, breakHours: TimePeriod(startTime: Date(), finishTime: Date()), deskNumber: 11))
        addEmployee(employee: Manager(name: "dwd", salary: 3000, meetingHours: TimePeriod(startTime: Date(), finishTime: Date())))
    }
}

// MARK: EmployeeManagerProtocol
extension EmployeeManager: EmployeeManagerProtocol {
    func addEmployee(employee: Employee) {
        // switch employee type, add to relevant group, renew the array.
        employees[2].append(employee)
    }

    func removeEmployee(employee: Employee) {
    }

    func fetchEmployeeData(from provider: EmployeeProvider) {
        self.employees = provider.fetchEmployeeData()
    }
}
