import Foundation
import SharedResources

public enum AccountantType {
    case payroll
    case inventory
}

class Accountant: Employee {
    let breakHours: TimePeriod
    let deskNumber: Int
    let accountantType: String

    init(
        name: String,
        salary: Double,
        breakHours: TimePeriod,
        deskNumber: Int,
        accountantType: AccountantType
    ) {

        self.breakHours = breakHours
        self.deskNumber = deskNumber
        switch accountantType {
        case .payroll:
            self.accountantType = SharedResources.L10n.payrollAccountant

        case .inventory:
            self.accountantType = SharedResources.L10n.inventoryAccountant
        }
        super.init(name: name, salary: salary, employeeType: .accountant)
    }
}
