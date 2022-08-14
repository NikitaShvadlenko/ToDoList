//
//  AppDelegate.swift
//  ToDoListBasic
//
//  Created by Nikita Shvad on 12.07.2022.
//

import UIKit
import CoreData
import SharedResources

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // swiftlint:disable:next discouraged_optional_collection
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let tabBarController = UITabBarController()
        window.rootViewController = tabBarController

        var viewControllers = [UIViewController]()

        let rootViewController = ListScreenBuilder.buildListScreen()
        rootViewController.tabBarItem.title = "Tab Bar Item"
        rootViewController.tabBarItem.image = UIImage(sfSymbol: SharedResources.SFSymbol.sliderHorizontal)

        let navigationController = UINavigationController(rootViewController: rootViewController)
        viewControllers.append(navigationController)

        tabBarController.setViewControllers(viewControllers, animated: false)

        self.window = window
        window.makeKeyAndVisible()
        return true
    }

    // MARK: - Core Data
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "ListCoreDataModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
