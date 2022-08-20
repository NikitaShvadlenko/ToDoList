import Foundation
import CoreData

public enum AccountantType: Int32 {
    case payroll = 0
    case inventory = 1
}

class Accountant: Employee {
    @NSManaged fileprivate(set) var breakHours: TimePeriod
    @NSManaged fileprivate(set) var deskNumber: Int
    @NSManaged fileprivate(set) var accountantTypeValue: Int32

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
}
