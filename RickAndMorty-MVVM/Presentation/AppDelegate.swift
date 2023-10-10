//
//  AppDelegate.swift
//  CarsArmando
//
//  Created by Juan Armando Frías Ramírez on 20/04/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var singleton: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = SplashScreen()
        window!.makeKeyAndVisible()

        return true
    }
    
    func goToHome() {
        window!.rootViewController = UINavigationController(rootViewController: HomeVC())
    }

}

