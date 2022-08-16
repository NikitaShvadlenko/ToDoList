import Foundation

protocol ManagerRepresentable {
    var meetingHours: TimePeriod { get }
}

class ManagerConstructor: ManagerRepresentable {
    let meetingHours: TimePeriod

    init(name: String, salary: Double, meetingHours: TimePeriod) {
        self.meetingHours = meetingHours
        super.init(name: name, salary: salary, employeeType: .management)
    }
}
