import Foundation

class EmployeeProvider {
    func fetchEmployeeData() -> [[Employee]] {
        let accountants = [
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

        let managers = [
            Management(
                name: "Manager444",
                salary: 400.00,
                meetingHours: TimePeriod(
                    startTime: Date(timeIntervalSince1970: 40),
                    finishTime: Date(timeIntervalSince1970: 50)
                )
            )
        ]

        let basicWorkers = [
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

        return [managers, basicWorkers, accountants]

    }
}
