import Foundation

class EmployeeManager: NSObject {
    var employees: [[Employee]]
    var accountants: [Accountant]
    let managers: [Management]
    var basicWorkers: [BasicWorker]

    override init() {
        accountants = [
            Accountant(
                name: "Valera",
                salary: 500.00,
                breakHours: TimePeriod(startTime: Date(timeIntervalSince1970: 20), finishTime: Date(timeIntervalSince1970: 30)),
                deskNumber: 5,
                accountantType: .payroll
            ),

            Accountant(
                name: "Zhmishenko Valeriy Albertovich",
                salary: 1500.00,
                breakHours: TimePeriod(startTime: Date(timeIntervalSince1970: 20), finishTime: Date(timeIntervalSince1970: 30)),
                deskNumber: 15,
                accountantType: .payroll
            )
        ]

        managers = [
            Management(
                name: "Manager444",
                salary: 400.00,
                meetingHours: TimePeriod(
                    startTime: Date(timeIntervalSince1970: 40),
                    finishTime: Date(timeIntervalSince1970: 50)
                )
            )
        ]

        basicWorkers = [
            BasicWorker(
                name: "Nikoglay",
                salary: 20.00,
                breakHours: TimePeriod(
                    startTime: Date(timeIntervalSince1970: 23),
                    finishTime: Date(timeIntervalSince1970: 54)
                ),
                deskNumber: 5
            )
        ]
        employees = [managers, accountants, basicWorkers]
    }
}
