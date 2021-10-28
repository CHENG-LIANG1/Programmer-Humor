//
//  AppDelegate.swift
//  GameList
//
//  Created by 梁程 on 2021/10/18.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        ShareSDK.registPlatforms { (platformRegister: SSDKRegister?) in
            platformRegister!.setupWeChat(withAppId: "wx32119fee5e0fd5d0", appSecret: "dbac20528c85cc67603e1d07a0623c7e", universalLink: "https://7bb5a379c82a51f31d5df11244b7b119.share2dlink.com/")
            platformRegister!.setupDingTalk(withAppId: "dingoau98tlq5tnunhrda1")
            platformRegister!.setupQQ(withAppId: "101972152", appkey: "f5fde9494db3ee6ed57c668689c2b1a5", enableUniversalLink: true, universalLink: "https://7bb5a379c82a51f31d5df11244b7b119.share2dlink.com/qq_conn/101972152")
            platformRegister!.setupSinaWeibo(withAppkey: "1583584072", appSecret: "1af52b32cfb788b68899e4ac64268bfd", redirectUrl: "http://www.sharesdk.cn", universalLink: "https://ziwkt.share2dlink.com/")
        }
        MobSDK.uploadPrivacyPermissionStatus(true, onResult: nil)
        MobSDK.registerAppKey("335add57614c8", appSecret: "d0977b7ace6ee29c1fc7ead056c4358d")
        MobPush.setAPNsForProduction(true)
        let configuration = MPushNotificationConfiguration()
        configuration.types = [.badge, .sound, .alert]
        MobPush.setupNotification(configuration)
        MobPush.setBadge(1)
        BUAdSDKManager.setAppID(K.app_id)
        BUAdSDKManager.setCoppa(0)
        BUAdSDKManager.setIsPaidApp(false)
        BUAdSDKManager.setLoglevel(BUAdSDKLogLevel.debug)
        BUAdSDKManager.setGDPR(1)
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

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "GameList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

