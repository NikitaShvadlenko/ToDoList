import Foundation
import CoreData

public enum EmployeeType: Int32 {
    case management = 0
    case accountant = 1
    case basicWorker = 2
}

class Employee: NSManagedObject {
    @NSManaged fileprivate(set) var name: String
    @NSManaged fileprivate(set) var salary: Double
    @NSManaged fileprivate(set) var employeeTypeValue: Int32

    var employeeType: EmployeeType {
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
}
