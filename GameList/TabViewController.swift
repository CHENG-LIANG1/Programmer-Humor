//
//  ViewController.swift
//  GameList
//
//  Created by 梁程 on 2021/10/18.
//

import UIKit
class TabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let homeVC = HomeViewController()
        let profileVC = SettingsViewController()
        let jokeVC = PHListViewController()

        let homeIcon = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        
        homeVC.tabBarItem = UITabBarItem.init(title: "JOD", image: homeIcon, tag: 0)
        homeVC.tabBarItem.selectedImage = UIImage(named: "home.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(K.brandYellow)
        
        profileVC.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage(named: "gear")?.withRenderingMode(.alwaysOriginal), tag: 0)
        profileVC.tabBarItem.selectedImage = UIImage(named: "gear.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(K.brandYellow)
        
        jokeVC.tabBarItem = UITabBarItem.init(title: "Jokes", image: UIImage(named: "laugh")?.withRenderingMode(.alwaysOriginal), tag: 0)
        jokeVC.tabBarItem.selectedImage = UIImage(named: "laugh.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(K.brandYellow)
        
        let image = UIImage(named: "bgGradient")
        let bgColor = UIColor.init(patternImage: image!)
        
        let selectedColor   = K.brandYellow
        
        if #available(iOS 15, *) {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.backgroundColor = bgColor
                tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedColor]
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
                tabBar.standardAppearance = tabBarAppearance
                tabBar.scrollEdgeAppearance = tabBarAppearance
            } else {
                
                tabBar.unselectedItemTintColor = .black
                UITabBar.appearance().barTintColor = bgColor
                let selectedColor   = K.brandYellow
                UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
          }

        
        
        tabBar.clipsToBounds = true
        tabBar.isTranslucent = false


        let controllerArray = [homeVC, jokeVC, profileVC]
        self.viewControllers = controllerArray.map{(UINavigationController.init(rootViewController: $0))}
    }
}

