//
//  OrderViewController.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-25.
//

import UIKit

class OrderViewController: BaseTableViewController<EntryTableViewCell, MenuItemSetting> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.allowsSelection = false
        self.items = [MenuItemSetting(menu: MenuItem(category: "aaa", id: 3, imageURL: "", name: "some food", description: "omg", price: 9.00), isDisplayIndicator: false)]
        let submitBtn = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(submitOrder))
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.items.isEmpty ? 44 : 100
    }
    
    @objc func submitOrder() {
        print("submit order")
        let randomTime = Int.random(in: 15...20)
        let alert = UIAlertController(title: nil, message: "Thank you for your order! Your waiting time is aproximately \(randomTime) minutes", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Dismiss", style: .default) { _ in
            //update ui
        }
        alert.addAction(action)
        self.present(alert, animated: true) {
            self.items = []
            self.tableView.reloadData()
        }
    }
}
