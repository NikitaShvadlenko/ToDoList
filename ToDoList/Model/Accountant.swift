import Foundation

public enum AccountantType: String {
    case payroll
    case inventory
}

class Accountant: Employee {
    let breakHours: TimePeriod
    let deskNumber: Int
    let accountantType: AccountantType
    let accountantTypeValue: String

    init(
        name: String,
        salary: Double,
        breakHours: TimePeriod,
        deskNumber: Int,
        accountantType: AccountantType
    ) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        self.accountantType = accountantType
        self.accountantTypeValue = accountantType.rawValue
        super.init(name: name, salary: salary, employeeType: .accountant)
    }
}
