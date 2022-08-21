import Foundation
import UIKit

public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {

        let viewController = ListViewController()
        let presenter = ListPresenter()
        let listProvider = ListProvider()
        let employeeManager = EmployeeManager()

        let addEmployeeUseCase = AddEmployeeUseCase(employeeManager: employeeManager)
       // let fetchListUseCase = FetchListFromCoreDataUseCase(employeeManager: employeeManager)
       let fetchListUseCase = FetchListUseCase(listProvider: listProvider, employeeManager: employeeManager)

        let listTableViewManager = MainScreenTableViewManager()

        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)
        viewController.setListDragDelegate(dragDelegate: listTableViewManager)

        presenter.tableViewManager = listTableViewManager
        presenter.fetchListUseCase = fetchListUseCase
        presenter.addEmployeeUseCase = addEmployeeUseCase

        //createListContainer { container in
          //  employeeManager.persistentContainer = container
           // employeeManager.managedObjectContext = container.viewContext
            presenter.viewController = viewController
            viewController.presenter = presenter
        //}
        return viewController
    }
}
