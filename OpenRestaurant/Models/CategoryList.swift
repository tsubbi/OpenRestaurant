//
//  CategoryList.swift
//  OpenRestaurant
//
//  Created by Jamie Chen on 2021-05-26.
//

import Foundation

struct CategoryList {
    private var entreesList: [MenuItem] = []
    private var appetizersList: [MenuItem] = []
    private var saladsList: [MenuItem] = []
    private var soupsList: [MenuItem] = []
    private var dessertsList: [MenuItem] = []
    private var sandwichesList: [MenuItem] = []
    
    init(dataSource: [MenuItem]) {
        dataSource.forEach({
            addItemToList(category: $0.category, item: $0)
        })
    }
    
    func getList(category: String) -> [MenuItem] {
        guard let type = CategoryListType(rawValue: category) else { return [] }
        switch type {
        case .appetizers:
            return appetizersList
        case .desserts:
            return dessertsList
        case .entrees:
            return entreesList
        case .salads:
            return saladsList
        case .sandwiches:
            return sandwichesList
        case .soups:
            return soupsList
        }
    }
    
    mutating func addItemToList(category: String, item: MenuItem) {
        guard let type = CategoryListType(rawValue: category) else { return }
        switch type {
        case .appetizers:
            appetizersList.append(item)
        case .salads:
            saladsList.append(item)
        case .soups:
            soupsList.append(item)
        case .entrees:
            entreesList.append(item)
        case .desserts:
            dessertsList.append(item)
        case .sandwiches:
            sandwichesList.append(item)
        }
    }
    
    func filterEmptyList() -> [[MenuItem]] {
        return [entreesList, appetizersList, saladsList, soupsList, dessertsList, sandwichesList].filter({ !$0.isEmpty })
    }
}

enum CategoryListType: String, CaseIterable {
    case appetizers
    case salads
    case soups
    case entrees
    case desserts
    case sandwiches
    
    var name: String {
        return self.rawValue.capitalized
    }
}
