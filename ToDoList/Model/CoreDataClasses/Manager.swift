import Foundation
import CoreData

class Manager: Employee {
    @NSManaged fileprivate(set) var meetingHours: TimePeriod

    static func insert(into context: NSManagedObjectContext, employee: ManagerRepresentable) -> Manager {
        let manager: Manager = context.insertObject()
        manager.meetingHours = employee.meetingHours
        manager.name = employee.name
        manager.salary = employee.salary
        return manager
    }
}
