import UIKit
import SharedResources
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // swiftlint:disable:next discouraged_optional_collection
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        createListContainer { container in
            let window = UIWindow(frame: UIScreen.main.bounds)
            let tabBarController = UITabBarController()
            window.rootViewController = tabBarController
            var viewControllers = [UIViewController]()
            let rootViewController = ListScreenBuilder.buildListScreen(container: container)
            rootViewController.tabBarItem.title = "Tab Bar Item"
            rootViewController.tabBarItem.image = UIImage(sfSymbol: SharedResources.SFSymbol.sliderHorizontal)
            let navigationController = UINavigationController(rootViewController: rootViewController)
            viewControllers.append(navigationController)
            tabBarController.setViewControllers(viewControllers, animated: false)
            self.window = window
            window.makeKeyAndVisible()
        }
        return true
    }
}
