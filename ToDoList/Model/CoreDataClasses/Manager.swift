import Foundation
import CoreData

class Manager: NSManagedObject {
    @NSManaged fileprivate(set) var meetingHours: TimePeriod
}
