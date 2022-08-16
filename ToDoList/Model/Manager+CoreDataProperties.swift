import CoreData

extension Manager {
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Manager> {
        NSFetchRequest<Manager>(entityName: "Manager")
    }

    @NSManaged public var meetingHours: TimePeriod

}
