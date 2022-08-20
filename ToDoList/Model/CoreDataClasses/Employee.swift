import Foundation
import CoreData

public enum EmployeeType: Int32 {
    case management = 0
    case accountant = 1
    case basicWorker = 2
}

class Employee: NSManagedObject {
    // swiftlint:disable:next lower_acl_than_parent
    @NSManaged public private(set) var name: String
    // swiftlint:disable:next lower_acl_than_parent
    @NSManaged public private(set) var salary: Double
    // swiftlint:disable:next lower_acl_than_parent
    @NSManaged public private(set) var employeeTypeValue: Int32

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
}
