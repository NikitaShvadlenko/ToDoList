import Foundation
import UIKit

public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {
        let viewController = ListViewController()
        let presenter = ListPresenter()
        let listProvider = ListProvider()
        let fetchListUseCase = FetchListUseCase(listProvider: listProvider)
        let employeeStorage = EmployeeStorage()

        let listTableViewManager = MainScreenTableViewManager()
        let employeeManager = EmployeeManager()

        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)
        viewController.setListDragDelegate(dragDelegate: listTableViewManager)

        presenter.tableViewManager = listTableViewManager
        presenter.fetchListUseCase = fetchListUseCase
        presenter.employeeStorage = employeeStorage
        presenter.employeeRepository = employeeManager

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
