import Foundation

protocol ListProviderProtocol {
    func fetchEmployeeData(completion: @escaping(Result<[[EmployeeRepresentable]], Error>) -> Void)
}

class ListProvider {

}

// MARK: - ListProviderProtocol
extension ListProvider: ListProviderProtocol {
    func fetchEmployeeData(completion: @escaping (Result<[[EmployeeRepresentable]], Error>) -> Void) {
        let accountants = [
            AccountantConstructor(
                name: "Леонид Аркадьевич Якубович",
                salary: 155000.00,
                breakHours: TimePeriod(startTime: Date(timeIntervalSince1970: 20), finishTime: Date()),
                deskNumber: 5,
                accountantType: .inventory
            ),

            AccountantConstructor(
                name: "Жмышенко Валерий Альбертович",
                salary: 150000.00,
                breakHours: TimePeriod(startTime: Date(timeIntervalSince1970: 20), finishTime: Date(timeIntervalSince1970: 30)),
                deskNumber: 15,
                accountantType: .payroll
            )
        ]

        let managers: [ManagerConstructor] = [

        ]

        let basicWorkers = [
            BasicWorkerConstructor(
                name: "Николай Николаевич Николаев",
                salary: 20000.00,
                breakHours: TimePeriod(
                    startTime: Date(timeIntervalSince1970: 23),
                    finishTime: Date(timeIntervalSince1970: 54)
                ),
                deskNumber: 5
            )
        ]

        completion(.success( [managers, basicWorkers, accountants] ))
    }

    func someEmployee() -> EmployeeRepresentable {
        ManagerConstructor(name: "VALAD VALALIS", salary: 150_000, meetingHours: TimePeriod(startTime: Date(), finishTime: Date()))
    }
}
