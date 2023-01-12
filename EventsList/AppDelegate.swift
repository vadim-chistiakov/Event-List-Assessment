//
//  AppDelegate.swift
//  EventsList


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customisation after application launch.
        let screenWindow = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        screenWindow.rootViewController = navigationController
        
        let coord = AppCoordinator(navigationController: navigationController)
        coord.start()
        
        appCoordinator = coord
        window = screenWindow
        
        screenWindow.makeKeyAndVisible()
        
        return true
    }
}
