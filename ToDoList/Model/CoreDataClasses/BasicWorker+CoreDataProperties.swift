import CoreData

extension BasicWorker {
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<BasicWorker> {
        NSFetchRequest<BasicWorker>(entityName: "BasicWorker")
    }

    @NSManaged public var breakHours: TimePeriod
    @NSManaged public var deskNumber: Int64
}
