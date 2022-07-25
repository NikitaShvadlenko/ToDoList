import Foundation

protocol EmployeeManagerProtocol {
    func fetchEmployeeData(from provider: EmployeeProvider)
    func addEmployee(employee: Employee)
    func removeEmployee(employee: Employee)
}

class EmployeeManager: NSObject {
    var employees: [[Employee]] = []

    override init() {
        let employeeDataProvider = EmployeeProvider()
        employees = employeeDataProvider.fetchEmployeeData()
    }
}

// MARK: EmployeeManagerProtocol
extension EmployeeManager: EmployeeManagerProtocol {
    func addEmployee(employee: Employee) {
    }

    func removeEmployee(employee: Employee) {
    }

    func fetchEmployeeData(from provider: EmployeeProvider) {
        self.employees = provider.fetchEmployeeData()
    }
}
