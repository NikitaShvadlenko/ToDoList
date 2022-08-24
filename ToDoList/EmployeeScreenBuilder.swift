import Foundation
import UIKit
import CoreData

public enum ListScreenBuilder {
    public static func buildListScreen(container: NSPersistentContainer) -> UIViewController {

        let viewController = ListViewController()
        let presenter = ListPresenter()
        // let listProvider = ListProvider()
        let employeeManager = EmployeeManager()
        let managedObjectContext = container.viewContext
        let addEmployeeUseCase = AddEmployeeUseCase(employeeManager: employeeManager)
        let fetchListUseCase = FetchListFromCoreDataUseCase(employeeManager: employeeManager)
      // let fetchListUseCase = FetchListUseCase(listProvider: listProvider, employeeManager: employeeManager)

        let listTableViewManager = MainScreenTableViewManager()

        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)
        viewController.setListDragDelegate(dragDelegate: listTableViewManager)

        presenter.tableViewManager = listTableViewManager
        presenter.fetchListUseCase = fetchListUseCase
        presenter.addEmployeeUseCase = addEmployeeUseCase

        employeeManager.persistentContainer = container
        employeeManager.managedObjectContext = managedObjectContext

        presenter.viewController = viewController
        viewController.presenter = presenter
        return viewController
    }
}
