//
//  WebService.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import Foundation

class WebService {
    func getAllOrders(completion: @escaping ([Order]?) -> ()) {
        
        guard let url = URL(string: "https://quaint-equable-xenoposeidon.glitch.me/orders") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
    }
}
