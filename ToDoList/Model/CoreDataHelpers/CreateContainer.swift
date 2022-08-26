import CoreData

// MARK: Create Container
func createListContainer(completion: @escaping (NSPersistentContainer) -> Void) {
    let container = NSPersistentContainer(name: "List")
    container.loadPersistentStores {_, error in
        guard error == nil else { fatalError("Failed loading persistent container") }
        DispatchQueue.main.async {
            completion(container)
        }
    }
}
