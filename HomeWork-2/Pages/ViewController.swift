//
//  ViewController.swift
//  HomeWork-2
//
//  Created by Akniyet Turdybay on 19.04.2022.
//

import UIKit

class ViewController: UITabBarController{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor(red: 236/255, green: 235/255, blue: 234/255, alpha: 1)
        configureTabBar()
    }
    
    
    private func configureTabBar(){
        
        
        
        let feedVC = configureNavBarController(vc: FeedViewController(), image: "text.below.photo.fill")
        feedVC.title = "My Feeds".localized()
        
        
        let friendsVC = configureNavBarController(vc: FriendsViewController(), image: "person.2.fill")
        friendsVC.title = "My Friends".localized()
        
        
        let pinsVC = configureNavBarController(vc: PinsViewController(), image: "pin")
        pinsVC.title = "My Pins".localized()
        
        
        let profileVC = configureNavBarController(vc: ProfileViewController(), image: "person.crop.rectangle.stack")
        profileVC.title = "My Profile".localized()
        
        
        self.setViewControllers([feedVC, friendsVC, pinsVC, profileVC], animated: false)
    }
}


extension UITabBarController{
    func configureNavBarController(vc: UIViewController, image: String) -> UINavigationController{
    
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = UIImage(systemName: image)
        return navController
        
    }
}

