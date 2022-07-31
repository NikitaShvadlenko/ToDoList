import Foundation
import SharedResources

public enum EmployeeType {
    case management
    case accountant
    case basicWorker
}

class Employee {
    let name: String
    let salary: Double
    let employeeType: EmployeeType

    init(name: String, salary: Double, employeeType: EmployeeType) {
        self.name = name
        self.salary = salary
        self.employeeType = employeeType
    }
}
