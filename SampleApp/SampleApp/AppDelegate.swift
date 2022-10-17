//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Praveen Kumar Vivekananthan on 10/16/22.
//

import UIKit
import AEPCore
import AEPUserProfile
import AEPIdentity
import AEPLifecycle
import AEPSignal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let LAUNCH_ENVIRONMENT_FILE_ID = "94f571f308d5/44ff240a3399/launch-e04a1f758d3d-development"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        MobileCore.setLogLevel(.trace)
        let appState = application.applicationState;

        let extensions = [Lifecycle.self, Identity.self, Signal.self, UserProfile.self]
        MobileCore.registerExtensions(extensions) {
        
            MobileCore.configureWith(appId: self.LAUNCH_ENVIRONMENT_FILE_ID)
            if appState != .background {
                // only start lifecycle if the application is not in the background
                MobileCore.lifecycleStart(additionalContextData: nil)
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

