//
//  MenuViewController.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-25.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    var foods = [
        MenuItem(category: "appetizers", id: 1, imageURL: "", name: "food1", description: "abcd", price: 9.36),
        MenuItem(category: "appetizers", id: 2, imageURL: "", name: "food3", description: "abcd", price: 9.36),
        MenuItem(category: "salads", id: 5, imageURL: "", name: "gameing", description: "nada", price: 9.66),
        MenuItem(category: "salads", id: 3, imageURL: "", name: "food2", description: "abcd", price: 9.36),
        MenuItem(category: "salads", id: 4, imageURL: "", name: "food4", description: "abcd", price: 9.36)
    ]

    lazy var foodList = CategoryList(dataSource: self.foods).filterEmptyList().map({
        $0.map({ MenuItemSetting(menu: $0, isDisplayIndicator: true) })
    })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(EntryTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EntryTableViewCell,
              let type = CategoryListType(rawValue: foodList[indexPath.row].first?.menu.category ?? ""),
              let item = foodList[indexPath.row].first else {
            return UITableViewCell()
        }
//        cell.foodImageView.image - load image from item.imageURL
        cell.foodNameLabel.text = type.name
        cell.accessoryType = .disclosureIndicator
        cell.foodPriceLabel.text = ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MenuTableViewController()
        vc.menuList = self.foodList[indexPath.row]
        vc.title = self.foodList[indexPath.row].first?.menu.category.capitalized
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
