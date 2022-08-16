import Foundation

protocol AccountantRepresentable {
    var breakHours: TimePeriod { get }
    var deskNumber: Int64 { get }
    var accountantTypeValue: Int32 { get }
    var name: String { get }
    var salary: Double { get }
    var accountantType: AccountantType { get }
}

// Class is dependent on EmployeeConstructor - dependency injection is not possible. Revisit this implementation.
class AccountantConstructor: EmployeeConstructor, AccountantRepresentable {
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
