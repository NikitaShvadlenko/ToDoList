import Foundation
import UIKit
import CoreData

public enum ListScreenBuilder {
    public static func buildListScreen(container: NSPersistentContainer) -> UIViewController {

        let viewController = ListViewController()
        let presenter = ListPresenter()
        let listTableViewManager = MainScreenTableViewManager()

        viewController.setListDataSource(dataSource: listTableViewManager)
        viewController.setListDelegate(delegate: listTableViewManager)
        viewController.setListDragDelegate(dragDelegate: listTableViewManager)

        presenter.managedObjectContext = container.viewContext

        presenter.viewController = viewController
        viewController.presenter = presenter
        return viewController
    }
}
