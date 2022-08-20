import Foundation
import CoreData

class Manager: Employee {
    @NSManaged fileprivate(set) var meetingHours: TimePeriod
}
