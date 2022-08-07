import Foundation
public enum ListScreenBuilder {
    public static func buildListScreen() -> UIViewController {
        let viewController = ListViewController()
        let presenter = ListPresenter()

        viewController.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}
