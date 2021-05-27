//
//  RestaurantTabBarController.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-25.
//

import UIKit

class RestaurantTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVC = CategoryTableViewController()
        menuVC.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu"), selectedImage: nil)
        menuVC.title = "Menu List"
        
        let orderVC = OrderViewController()
        orderVC.tabBarItem = UITabBarItem(title: "Your Order", image: UIImage(named: "order"), selectedImage: nil)
        orderVC.title = "Order List"
        
        let subVCs = [menuVC, orderVC].map({ UINavigationController(rootViewController: $0) })
        subVCs.first?.navigationBar.prefersLargeTitles = true
        
        self.viewControllers = subVCs
    }
}
