//
//  OrdersListingViewModel.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import Foundation

class OrdersListingViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        WebService().getAllOrders { orders in
            
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
            
        }
    }
    
}

class OrderViewModel {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeeName: String {
        return self.order.coffeeName
    }
    
    var total: Double {
        return self.order.total
    }
    
}
