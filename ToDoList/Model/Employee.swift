import Foundation

public protocol EmployeeRepresentable: AnyObject {
    var name: String { get }
    var salary: Double { get }
    var employeeType: EmployeeType { get set }
    var employeeTypeValue: Int32 { get }
}

class EmployeeConstructor: EmployeeRepresentable {
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
