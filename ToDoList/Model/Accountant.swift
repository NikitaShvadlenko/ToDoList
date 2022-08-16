import Foundation

protocol AccountantRepresentable {
    var breakHours: TimePeriod { get }
    var deskNumber: Int64 { get }
    var accountantTypeValue: Int32 { get set }
}

class AccountantConstructor: AccountantRepresentable {
    let breakHours: TimePeriod
    let deskNumber: Int64
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
        deskNumber: Int64,
        accountantType: AccountantType
    ) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        self.accountantTypeValue = accountantType.rawValue
        super.init(name: name, salary: salary, employeeType: .accountant)
    }
}
