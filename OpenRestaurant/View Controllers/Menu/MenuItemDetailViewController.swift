//
//  MenuItemDetailViewController.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-27.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    // views
    var foodImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "food_default")
        return iv
    }()
    var foodNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    var foodPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    var foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    
    // variables
    var menuItem: MenuItem? {
        didSet {
            if let setting = menuItem {
                self.foodImageView.image = setting.image ?? #imageLiteral(resourceName: "food_default")
                self.foodNameLabel.text = setting.name
                self.foodPriceLabel.text = "$\(setting.price)"
                self.foodDescriptionLabel.text = setting.description
                self.foodDescriptionLabel.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        let foodNamePriceStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.foodNameLabel, self.foodPriceLabel])
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fill
            return stack
        }()
        let outerStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.foodImageView, foodNamePriceStackView, self.foodDescriptionLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 10
            return stack
        }()
        self.view.addSubview(outerStack)
        let orderButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
            btn.backgroundColor = .systemBlue
            btn.setTitle("Add To Order", for: .normal)
            btn.titleLabel?.tintColor = .white
            btn.addTarget(self, action: #selector(addOrder), for: .touchUpInside)
            return btn
        }()
        self.view.addSubview(orderButton)
        
        let safeArea = self.view.safeAreaLayoutGuide
        self.foodImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4).isActive = true
        
        outerStack.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15).isActive = true
        outerStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15).isActive = true
        outerStack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15).isActive = true
        
        orderButton.leadingAnchor.constraint(equalTo: outerStack.leadingAnchor).isActive = true
        orderButton.trailingAnchor.constraint(equalTo: outerStack.trailingAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15).isActive = true
    }
    
    @objc func addOrder() {
        guard let item = self.menuItem else { return }
        print("Add order")
    }
}
