import Foundation

class Manager: Employee {
    let meetingHours: TimePeriod

    init(name: String, salary: Double, meetingHours: TimePeriod) {
        self.meetingHours = meetingHours
        super.init(name: name, salary: salary, employeeType: .management)
    }
}
