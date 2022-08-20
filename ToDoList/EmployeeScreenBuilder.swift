import Foundation
import UIKit

public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {

        let viewController = ListViewController()
        let presenter = ListPresenter()
        let listProvider = ListProvider()
        let employeeManager = EmployeeManager()
        let fetchListUseCase = FetchListUseCase(listProvider: listProvider, employeeManager: employeeManager)

        let listTableViewManager = MainScreenTableViewManager()

        createListContainer { container in
            employeeManager.persistentContainer = container
            employeeManager.managedObjectContext = container.viewContext
        }
        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)
        viewController.setListDragDelegate(dragDelegate: listTableViewManager)

        presenter.tableViewManager = listTableViewManager
        presenter.fetchListUseCase = fetchListUseCase

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
