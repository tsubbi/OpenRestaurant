//
//  MenuTableViewController.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-27.
//

import UIKit

class MenuTableViewController: BaseTableViewController<EntryTableViewCell, MenuItemSetting> {

    var menuList: [MenuItemSetting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = menuList
        self.tableView.rowHeight = 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MenuItemDetailViewController()
        detailVC.menuItem = self.items[indexPath.row].menu
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
