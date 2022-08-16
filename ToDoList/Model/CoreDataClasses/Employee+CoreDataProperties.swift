import CoreData

extension Employee {

    public enum EmployeeType: Int32 {
        case management = 0
        case accountant = 1
        case basicWorker = 2
    }

    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Employee> {
        NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var employeeTypeValue: Int32
    @NSManaged public var name: String
    @NSManaged public var salary: Double

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

extension Employee: Identifiable {

}
