//
//  OrderListView.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            
            ForEach(self.orders, id:\.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    VStack {
                        Text(order.name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding([.leading, .bottom], 10)
                        
                        HStack {
                            Text(order.coffeeName)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                            Text(order.size)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order( name: "Abhiroop", size: "Medium", coffeeName: "Regular", total: 3.0))])
    }
}
