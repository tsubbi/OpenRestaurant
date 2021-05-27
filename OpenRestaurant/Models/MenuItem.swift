//
//  MenuItem.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-26.
//

import UIKit

struct MenuItem {
    let category: String
    let id: Int
    let imageURL: String
    let image: UIImage? = nil
    let name: String
    let description: String
    let price: Double
}

extension MenuItem: Codable {
    enum CodingKeys: String, CodingKey {
        case category
        case id
        case name
        case imageURL = "image_url"
        case description
        case price
    }
}
