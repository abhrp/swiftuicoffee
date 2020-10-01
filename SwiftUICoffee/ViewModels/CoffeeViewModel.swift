//
//  CoffeeViewModel.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageUrl: String {
        return self.coffee.imageUrl
    }
    
    var price: Double {
        return self.coffee.price
    }
    
}
