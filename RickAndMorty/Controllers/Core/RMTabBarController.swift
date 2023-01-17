//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Shagun on 26/12/22.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .red
        setUpTabs()
        // Do any additional setup after loading the view.
    }

    private func setUpTabs() {
        
        let characterVC = RMCharacterViewController()
        let episodeVC = RMEpisodeViewController()
        let locationVC = RMLocationViewController()
        let settingVC = RMSettingsViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        settingVC .navigationItem.largeTitleDisplayMode = .automatic

        characterVC.title = "Characters"
        episodeVC.title = "Episode"
        locationVC.title = "Location"
        settingVC.title = "Settings"

        
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: episodeVC)
        let nav3 = UINavigationController(rootViewController: locationVC)
        let nav4 = UINavigationController(rootViewController: settingVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Episode",image: UIImage(systemName: "tv"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Location",image: UIImage(systemName: "globe"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings",image: UIImage(systemName: "gear"), tag: 4)

        for nav in [nav1,nav2,nav3,nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
    }
    

}

