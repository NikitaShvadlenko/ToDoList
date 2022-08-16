import CoreData

public enum AccountantType: Int32 {
    case payroll = 0
    case inventory = 1
}

extension Accountant {
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Accountant> {
        NSFetchRequest<Accountant>(entityName: "Accountant")
    }

    @NSManaged public var accountantTypeValue: Int32
    @NSManaged public var breakHours: TimePeriod
    @NSManaged public var deskNumber: Int64

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
