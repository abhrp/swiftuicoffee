//
//  AddCoffeeOrderViewModel.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    private var webService: WebService
    
    var name: String = ""
    @Published  var size: String = "Medium"
    @Published  var coffeeName: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    init() {
        webService = WebService()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        self.webService.createCoffeeOrder(order: order) { _ in
            
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first {$0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
    
}
