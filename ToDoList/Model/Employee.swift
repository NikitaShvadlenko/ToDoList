import Foundation
import SharedResources

public enum AccountantType {
    case payroll
    case inventory
}
public enum EmployeeType {
    case management
    case accountant
    case basicWorker
}

class Employee {
    let name: String
    let salary: Double
    let employeeType: EmployeeType

    init(name: String, salary: Double, employeeType: EmployeeType) {
        self.name = name
        self.salary = salary
        self.employeeType = employeeType
    }
}

class Management: Employee {
    let meetingHours: TimePeriod

    init(name: String, salary: Double, meetingHours: TimePeriod) {
        self.meetingHours = meetingHours
        super.init(name: name, salary: salary, employeeType: .management)
    }
}

class BasicWorker: Employee {
    let breakHours: TimePeriod
    let deskNumber: Int

    init(name: String, salary: Double, breakHours: TimePeriod, deskNumber: Int) {
        self.breakHours = breakHours
        self.deskNumber = deskNumber
        super.init(name: name, salary: salary, employeeType: .basicWorker)
    }
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
