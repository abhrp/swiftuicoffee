//
//  AddCoffeeOrderView.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @Binding var isPresented: Bool
    
    @ObservedObject private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Form {
                    
                    Section(header: Text("INFORMATION").font(.body).foregroundColor(Color.black), content: {
                        TextField("Enter name", text: self.$addCoffeeOrderViewModel.name)
                    })
                    
                    Section(header: Text("SELECT COFFEE").font(.body).foregroundColor(Color.black), content: {
                        ForEach(addCoffeeOrderViewModel.coffeeList, id: \.name) {coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderViewModel.coffeeName)
                        }
                    })
                    
                    Section(header: Text("SELECT SIZE").font(.body).foregroundColor(Color.black), footer: OrderTotalView(total: self.addCoffeeOrderViewModel.total)) {
                        Picker("", selection: self.$addCoffeeOrderViewModel.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place Order") {
                        self.addCoffeeOrderViewModel.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100)).foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(12)
            }
            .navigationBarTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageUrl)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
                .foregroundColor(Color.black)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "")
                .padding()
        }.onTapGesture{
            self.selection = self.coffee.name
        }
    }
}
