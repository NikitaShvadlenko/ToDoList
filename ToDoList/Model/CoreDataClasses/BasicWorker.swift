import Foundation
import CoreData

class BasicWorker: Employee {
    @NSManaged fileprivate(set) var breakHours: TimePeriod
    @NSManaged fileprivate(set) var deskNumber: Int
}
