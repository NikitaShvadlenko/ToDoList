import Foundation
import CoreData

class BasicWorker: Employee {
    @NSManaged fileprivate(set) var breakHours: TimePeriod
    @NSManaged fileprivate(set) var deskNumber: Int

    static func insert(into context: NSManagedObjectContext, employee: BasicWorkerRepresentable) -> BasicWorker {
        let basicWorker: BasicWorker = context.insertObject()
        basicWorker.name = employee.name
        basicWorker.salary = employee.salary
        basicWorker.breakHours = employee.breakHours
        basicWorker.deskNumber = employee.deskNumber
        return basicWorker
    }
}
