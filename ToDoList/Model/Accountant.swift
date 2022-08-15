import Foundation

public enum AccountantType: Int32 {
    case payroll = 0
    case inventory = 1
}

class Accountant: Employee {
    let breakHours: TimePeriod
    let deskNumber: Int
    var accountantTypeValue: Int32

    var accountantType: AccountantType {
        get {
            guard let accountantType = AccountantType(rawValue: accountantTypeValue) else {
                fatalError("Accountant Type raw Value is not matching")
            }
            return accountantType
        }
        set {
            self.accountantTypeValue = newValue.rawValue
        }
    }

    init(
        name: String,
        salary: Double,
        breakHours: TimePeriod,
        deskNumber: Int,
        accountantType: AccountantType
    ) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        self.accountantTypeValue = accountantType.rawValue
        super.init(name: name, salary: salary, employeeType: .accountant)
    }
}
