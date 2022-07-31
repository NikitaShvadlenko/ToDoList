import Foundation

class EmployeeProvider {
    func fetchEmployeeData() -> [[Employee]] {
        let accountants = [
            Accountant(
                name: "Леонид Аркадьевич Якубович",
                salary: 155000.00,
                breakHours: TimePeriod(startTime: Date(timeIntervalSince1970: 20), finishTime: Date()),
                deskNumber: 5,
                accountantType: .payroll
            ),

            Accountant(
                name: "Жмышенко Валерий Альбертович",
                salary: 150000.00,
                breakHours: TimePeriod(startTime: Date(timeIntervalSince1970: 20), finishTime: Date(timeIntervalSince1970: 30)),
                deskNumber: 15,
                accountantType: .payroll
            )
        ]

        let managers = [
            Manager(
                name: "Розинкова Татьяна Петровна",
                salary: 400000.00,
                meetingHours: TimePeriod(
                    startTime: Date(timeIntervalSince1970: 40),
                    finishTime: Date(timeIntervalSince1970: 50)
                )
            )
        ]

        let basicWorkers = [
            BasicWorker(
                name: "Николай Николаевич Николаев",
                salary: 20000.00,
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
