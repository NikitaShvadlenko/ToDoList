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

    var aemployeeType: EmployeeType {
        get {
            guard let employeeType = EmployeeType(rawValue: employeeTypeValue) else {
                fatalError("Accountant Type raw Value is not matching")
            }
            return employeeType
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
