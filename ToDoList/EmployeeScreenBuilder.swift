import Foundation
import UIKit

public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {
        let viewController = ListViewController()
        let presenter = ListPresenter()
        let listProvider = ListProvider()
        let fetchListUseCase = FetchListUseCase(listProvider: listProvider)

        let listTableViewManager = MainScreenTableViewManager()

        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)

        presenter.tableViewManager = listTableViewManager
        presenter.fetchListUseCase = fetchListUseCase

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
