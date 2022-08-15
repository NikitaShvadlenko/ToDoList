import Foundation
import CoreData

public enum EmployeeType: String {
    case management
    case accountant
    case basicWorker
}

class Employee {
    let name: String
    let salary: Double
    let employeeType: EmployeeType
    let employeeTypeValue: String

    init(name: String, salary: Double, employeeType: EmployeeType) {
        self.name = name
        self.salary = salary
        self.employeeType = employeeType
        self.employeeTypeValue = employeeType.rawValue
    }
}

// MARK: Equatable
extension Employee: Equatable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.name == rhs.name && lhs.salary == rhs.salary && lhs.employeeType == rhs.employeeType
    }
}
