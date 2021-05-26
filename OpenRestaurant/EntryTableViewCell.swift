//
//  EntryTableViewCell.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-26.
//

import UIKit

class EntryTableViewCell: BaseTableViewCell<MenuItemSetting> {
    
    // views
    let foodImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "food_default")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Food Name"
        return label
    }()
    let foodPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center
        label.text = "$0.00"
        return label
    }()
    
    override var settingModel: MenuItemSetting? {
        didSet {
            if let setting = settingModel {
                self.foodNameLabel.text = setting.menu.name
                self.foodPriceLabel.text = "$\(setting.menu.price)"
                self.foodPriceLabel.sizeToFit()
                self.accessoryType = setting.isDisplayIndicator ? .disclosureIndicator : .none
            }
        }
    }
    private var priceLabelWidthConstant: NSLayoutConstraint?
    
    override func layoutUI() {
        self.contentView.addSubview(foodImageView)
        self.contentView.addSubview(foodPriceLabel)
        self.contentView.addSubview(foodNameLabel)
        
        self.foodImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.9).isActive = true
        self.foodImageView.widthAnchor.constraint(equalTo: self.foodImageView.heightAnchor).isActive = true
        self.foodImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.foodImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        
        self.foodPriceLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.foodPriceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        self.foodNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.foodNameLabel.leadingAnchor.constraint(equalTo: self.foodImageView.trailingAnchor, constant: 10).isActive = true
        self.foodNameLabel.trailingAnchor.constraint(equalTo: self.foodPriceLabel.leadingAnchor, constant: -10).isActive = true
    }
}

struct MenuItemSetting {
    let menu: MenuItem
    let isDisplayIndicator: Bool
}
