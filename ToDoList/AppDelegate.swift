//
//  AppDelegate.swift
//  ToDoListBasic
//
//  Created by Nikita Shvad on 12.07.2022.
//

import UIKit
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

        let rootViewController = ListViewController()
        rootViewController.tabBarItem.title = "Tab Bar Item"
        rootViewController.tabBarItem.image = UIImage(sfSymbol: SharedResources.SFSymbol.sliderHorizontal)

        let navigationController = UINavigationController(rootViewController: rootViewController)
        viewControllers.append(navigationController)

        tabBarController.setViewControllers(viewControllers, animated: false)

        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
