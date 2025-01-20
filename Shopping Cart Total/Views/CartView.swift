//
//  ContentView.swift
//  Shopping Cart Total
//
//  Created by Yuk Yeung Chao on 2025-01-20.
//

import SwiftUI

struct CartView: View {
    // MARK: Stored properties
    
    // What number the user has provided
    @State var firstNumber = 20.0
    @State var secondNumber = 10.0
    @State var thirdNumber = 30.0
    @State var givenInput1 = ""
    @State var givenInput2 = ""
    @State var givenInput3 = ""
    
    // Feedback to the user on what to try next
    @State var feedback = ""
    
    
    
    
    
    var body: some View {
        NavigationStack {
            
            TextField("Price for your product", text: $givenInput1)
            TextField("Price for your product", text: $givenInput2)
            TextField("Price for your product", text: $givenInput3)
            
            Button {
                checkTotalPrice()
            } label: {
                Text("Check Total Price")
            }
            .buttonStyle(.borderedProminent)
            
            
            
            
            
            
        }
    }
    
    func checkTotalPrice() {
        
        // Attempt to unwrap the input provided by the user
        guard let ProvidedNumber = Double(givenInput1) else {
            feedback = "Please provide an Double."
            return
        }
        
        
    }
}
                
                
#Preview {
    CartView()
}
