import Foundation

public protocol BasicWorkerRepresentable: EmployeeRepresentable {
    var breakHours: TimePeriod { get }
    var deskNumber: Int { get }
    var name: String { get }
    var salary: Double { get }
}

// Class is dependent on EmployeeConstructor - dependency injection is not possible. Revisit this implementation.
class BasicWorkerConstructor: EmployeeConstructor, BasicWorkerRepresentable {
    let breakHours: TimePeriod
    let deskNumber: Int

    init(name: String, salary: Double, breakHours: TimePeriod, deskNumber: Int) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        super.init(name: name, salary: salary, employeeType: .basicWorker)
    }
}
