import CoreData

protocol EmployeeManagerProtocol {
    // func addEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void)
    func removeEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void)
    //  func updateEmployeeList(with employee: EmployeeRepresentable)
    func fetchEmployeeList(from listProvider: ListProviderProtocol, completion: @escaping(Result<[[EmployeeRepresentable]], Error>) -> Void)
    func fetchFromCoreData(completion: @escaping(Result<[[EmployeeRepresentable]], Error>) -> Void)
}

class EmployeeManager: NSObject {
    let employeeDataProvider = ListProvider()
    var employees: [[EmployeeRepresentable]] = []

    var managedObjectContext: NSManagedObjectContext?
    var persistentContainer: NSPersistentContainer?

    private var accountants: [AccountantRepresentable] = []
    private var managers: [ManagerRepresentable] = []
    private var basicWorkers: [BasicWorkerRepresentable] = []

    override init() {
        super.init()
    }
}

// MARK: EmployeeManagerProtocol
extension EmployeeManager: EmployeeManagerProtocol {

    func fetchEmployeeList(from listProvider: ListProviderProtocol, completion: @escaping(Result<[[EmployeeRepresentable]], Error>) -> Void) {
        listProvider.fetchEmployeeData { result in
            switch result {

            case let .success(employees):
                self.employees = employees

            case let .failure(error):
                print(error)
            }
            completion(result)
        }
    }

    //    func addEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void) {
    //        updateEmployeeList(with: employee)
    //        completion(.success(Void()))
    //    }

   func removeEmployee(employee: EmployeeRepresentable, completion: @escaping (Result<Void, Error>) -> Void) {
        switch employee.employeeType {

        case .management:
            self.managers = self.managers.filter { $0 !== employee }

        case .accountant:
            self.accountants = self.accountants.filter { $0 !== employee }

        case .basicWorker:
            self.basicWorkers = self.basicWorkers.filter { $0 !== employee }
        }

        employees = [managers, accountants, basicWorkers]

        completion(.success(Void()))
    }

    //    func updateEmployeeList(with employee: EmployeeRepresentable) {
    //
    //        switch employee.employeeType {
    //
    //        case .management:
    //            guard let manager = employee as? ManagerRepresentable else { return }
    //            managers.append(manager)
    //
    //        case .accountant:
    //            guard let accountant = employee as? AccountantRepresentable else { return }
    //            accountants.append(accountant)
    //
    //        case .basicWorker:
    //            guard let basicWorker = employee as? BasicWorkerRepresentable else { return }
    //            basicWorkers.append(basicWorker)
    //        }
    //
    //        employees = [managers, basicWorkers, accountants]
    //    }
}

// MARK: Core Data
extension EmployeeManager {

     func fetchFromCoreData(completion: @escaping(Result<[[EmployeeRepresentable]], Error>) -> Void) {
        self.basicWorkers = fetchBasicWorkersFromContainer()
        self.managers = fetchManagersFromContainer()
        self.accountants = fetchAccountantsFromContainer()

        self.employees = [basicWorkers, accountants, managers]
        completion(.success(employees))
    }

    private func fetchBasicWorkersFromContainer() -> [BasicWorkerRepresentable] {
        guard let context = managedObjectContext else { fatalError("Could not create managed context") }
        let request = BasicWorker.sortedFetchRequest
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

        do {
            let result = try fetchResultController.fetchRequest.execute()
            var convertedBasicWorkers: [BasicWorkerRepresentable] = []
            for basicWorker in result {
                convertedBasicWorkers.append(
                    BasicWorkerConstructor(
                        name: basicWorker.name,
                        salary: basicWorker.salary,
                        breakHours: basicWorker.breakHours,
                        deskNumber: Int64(basicWorker.deskNumber)
                    )
                )
            }
            return basicWorkers
        } catch {
            return []
        }
    }

    private func fetchAccountantsFromContainer() -> [AccountantRepresentable] {
        guard let context = managedObjectContext else { fatalError("Could not create managed context") }
        let request = Accountant.sortedFetchRequest
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

        do {
            let result = try fetchResultController.fetchRequest.execute()
            var convertedAccountants: [AccountantRepresentable] = []
            for accountant in result {
                convertedAccountants.append(
                    AccountantConstructor(
                        name: accountant.name,
                        salary: accountant.salary,
                        breakHours: accountant.breakHours,
                        deskNumber: Int64(accountant.deskNumber),
                        accountantType: accountant.accountantType
                    )
                )
            }
            return convertedAccountants
        } catch {
            return []
        }
    }

    private func fetchManagersFromContainer() -> [ManagerRepresentable] {
        guard let context = managedObjectContext else { fatalError("Could not create managed context") }
        let request = Manager.sortedFetchRequest
        request.fetchBatchSize = 20
        request.returnsObjectsAsFaults = false
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)

        do {
            let result = try fetchResultController.fetchRequest.execute()
            var convertedManagers: [ManagerRepresentable] = []
            for manager in result {
                convertedManagers.append(
                    ManagerConstructor(
                        name: manager.name,
                        salary: manager.salary,
                        meetingHours: manager.meetingHours
                    )
                )
            }
            return convertedManagers
        } catch {
            return []
        }
    }
}
