import Foundation

class EmployeeManager: NSObject {
    let employees: [Employee]

    override init() {
        employees = [Employee(name: "Vasia", salary: 40.00)]
    }
}
