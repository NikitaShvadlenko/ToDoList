import Foundation

public protocol ManagerRepresentable: EmployeeRepresentable {
    var meetingHours: TimePeriod { get }
    var name: String { get }
    var salary: Double { get }
}

// Class is dependent on EmployeeConstructor - dependency injection is not possible. Revisit this implementation.
class ManagerConstructor: EmployeeConstructor, ManagerRepresentable {
    let meetingHours: TimePeriod

    init(name: String, salary: Double, meetingHours: TimePeriod) {
        self.meetingHours = meetingHours
        super.init(name: name, salary: salary, employeeType: .manager)
    }
}
