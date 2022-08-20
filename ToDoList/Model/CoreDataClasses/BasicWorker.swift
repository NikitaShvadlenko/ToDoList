import Foundation
import CoreData

class BasicWorker: NSManagedObject {
    @NSManaged fileprivate(set) var breakHours: TimePeriod
    @NSManaged fileprivate(set) var deskNumber: Int
}
