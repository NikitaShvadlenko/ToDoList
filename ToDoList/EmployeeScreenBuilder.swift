import Foundation
import UIKit

public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {
        let viewController = ListViewController()
        let presenter = ListPresenter()

        let listTableViewManager = MainScreenTableViewManager()
        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
