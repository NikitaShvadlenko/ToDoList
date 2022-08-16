import Foundation
protocol BasicWorkerRepresentable {
    var breakHours: TimePeriod { get }
    var deskNumber: Int64 { get }
}

class BasicWorkerConstructor: BasicWorkerRepresentable {
    let breakHours: TimePeriod
    let deskNumber: Int64

    init(name: String, salary: Double, breakHours: TimePeriod, deskNumber: Int64) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        super.init(name: name, salary: salary, employeeType: .basicWorker)
    }
}
