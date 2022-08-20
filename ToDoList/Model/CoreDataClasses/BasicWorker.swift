import Foundation

class BasicWorker: Employee {
    let breakHours: TimePeriod
    let deskNumber: Int

    init(name: String, salary: Double, breakHours: TimePeriod, deskNumber: Int) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        super.init(name: name, salary: salary, employeeType: .basicWorker)
    }
}
