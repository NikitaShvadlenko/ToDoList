import Foundation
import CoreData

protocol EmployeeStorageProtocol {
    var persistentContainer: NSPersistentContainer { get }

    func saveContext()
}

class EmployeeStorage: EmployeeStorageProtocol {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ListCoreDataModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()

            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
