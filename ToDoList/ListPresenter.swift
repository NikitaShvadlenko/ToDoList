import Foundation
import UseCase
import CoreData
import UIKit

class ListPresenter {
    weak var viewController: ListScreenControllerInput?
    var tableViewManager: MainScreenTableViewManager?
    var fetchListUseCase: AsyncUseCase<Void, [[EmployeeRepresentable]]>?
    var persistentContainer: PersistentContainer?
}

extension ListPresenter: ListScreenControllerOutput {
    func viewDidLoad(_ view: ListScreenControllerInput) {
        fetchEmployeeList()
        saveDataToCoreData()
        retrieveFromCoreData()
    }

    func viewDidTapAddEmployeeButton(_ view: ListScreenControllerInput) {
        print("Tapped Employee Button")
    }
}

// MARK: - Private Methods
extension ListPresenter {
    private func fetchEmployeeList() {
        fetchListUseCase?.executeAsync { [weak self] result in
            switch result {
            case let .success(employees):
                self?.tableViewManager?.setEmployees(employees)
                self?.viewController?.reloadList()

            case let.failure(error):
                print(error)
            }
        }
    }

    private func saveDataToCoreData() {
        let container = PersistentContainer.shared.persistentContainer
        let context = container.viewContext

        container.loadPersistentStores(completionHandler: { result, error in
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Accountant", into: context)
            newUser.setValue("ALALA", forKey: AccountantKeys.name.rawValue)
            newUser.setValue(25.000, forKey: AccountantKeys.salary.rawValue)
            newUser.setValue(1, forKey: AccountantKeys.employeeTypeValue.rawValue)
            newUser.setValue(12, forKey: AccountantKeys.deskNumber.rawValue)
            newUser.setValue(TimePeriod(startTime: Date(), finishTime: Date()), forKey: AccountantKeys.breakHours.rawValue)
            newUser.setValue(1, forKey: AccountantKeys.accountantTypeValue.rawValue)
            do {
                try context.save()
            } catch {
                print("Error saving")
            }
        })
    }

    private func retrieveFromCoreData() {
        let container = PersistentContainer.shared.persistentContainer
        let context = PersistentContainer.shared.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Accountant")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            // swiftlint:disable:next force_cast
            for data in result as! [NSManagedObject]
            {
                // swiftlint:disable:next force_cast
                print(data.value(forKey: AccountantKeys.name.rawValue) as! String)
            }

        } catch {

            print("Failed")
        }
    }

    enum AccountantKeys: String {
        case name
        case salary
        case employeeTypeValue
        case deskNumber
        case breakHours
        case accountantTypeValue
    }
}
