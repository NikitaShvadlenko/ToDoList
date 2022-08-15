import Foundation
import CoreData

public enum EmployeeType: Int32 {
    case management = 0
    case accountant = 1
    case basicWorker = 2
}

class Employee {
    let name: String
    let salary: Double
    var employeeTypeValue: Int32

    var employeeType: EmployeeType {
        get {
            guard let employeeType = EmployeeType(rawValue: self.employeeTypeValue) else {
                fatalError("Employee Type raw Value is not matchiing")
            }
            return  employeeType
        }
        set {
            self.employeeTypeValue = newValue.rawValue
        }
    }

    init(name: String, salary: Double, employeeType: EmployeeType) {
        self.name = name
        self.salary = salary
        self.employeeTypeValue = employeeType.rawValue
    }
}

// MARK: Equatable
extension Employee: Equatable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.name == rhs.name && lhs.salary == rhs.salary && lhs.employeeType == rhs.employeeType
    }
}
