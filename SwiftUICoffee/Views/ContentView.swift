//
//  ContentView.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var ordersListingViewModel = OrdersListingViewModel()
    
    @State private var showModal: Bool = false
    
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.ordersListingViewModel.orders)

                .navigationBarTitle(Text("Coffee Orders"))
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise").foregroundColor(Color.blue)
                }, trailing: Button(action: showAddCoffeeOrderView) {
                    Image(systemName: "plus").foregroundColor(Color.blue)
                })
            
                .sheet(isPresented: $showModal, onDismiss: reloadOrders) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
            
        }
        
    }
    
    private func reloadOrders() {
        self.ordersListingViewModel.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
