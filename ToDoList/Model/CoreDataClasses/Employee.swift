import Foundation
import CoreData

public enum EmployeeType: Int32, CaseIterable {
    case manager = 0
    case accountant = 1
    case basicWorker = 2
}

class Employee: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var salary: Double
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

extension Employee: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        [NSSortDescriptor(key: #keyPath(name), ascending: false)]
    }
}
