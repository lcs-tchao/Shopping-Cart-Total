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
    
    
    
    
    
    var body: some View {
        NavigationStack {
            
            TextField("Price for your product", text: $givenInput1)
            TextField("Price for your product", text: $givenInput2)
            TextField("Price for your product", text: $givenInput3)
            
        }
        
        
    }
}

#Preview {
    CartView()
}
