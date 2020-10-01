//
//  ContentView.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var ordersListingViewModel = OrdersListingViewModel()
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.ordersListingViewModel.orders)
            
                .navigationBarTitle("Coffee Orders")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
