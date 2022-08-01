import Foundation

public enum EmployeeType {
    case management
    case accountant
    case basicWorker
}

class Employee: Equatable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.name == rhs.name && lhs.salary == rhs.salary && lhs.employeeType == rhs.employeeType
    }

    let name: String
    let salary: Double
    let employeeType: EmployeeType

    init(name: String, salary: Double, employeeType: EmployeeType) {
        self.name = name
        self.salary = salary
        self.employeeType = employeeType
    }
}
