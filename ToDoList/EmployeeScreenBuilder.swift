import Foundation
import UIKit

public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {
        let viewController = ListViewController()
        let presenter = ListPresenter()
        let listProvider = ListProvider()
        let employeeManager = EmployeeManager()
        let fetchListUseCase = FetchListUseCase(listProvider: listProvider, employeeManager: employeeManager)
        let employeeStorage = EmployeeStorage()

        let listTableViewManager = MainScreenTableViewManager()

        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)
        viewController.setListDragDelegate(dragDelegate: listTableViewManager)

        presenter.tableViewManager = listTableViewManager
        presenter.fetchListUseCase = fetchListUseCase
        presenter.employeeStorage = employeeStorage

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
