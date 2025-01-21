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
    let tax = 0.13

    @State var givenInput1 = ""
    @State var givenInput2 = ""
    @State var givenInput3 = ""
    
    // Feedback to the user on what to try next
    @State var feedback = ""
    @State var feedback2 = ""
    
    //computed properties
    
   
    
    
    
    var body: some View {
        NavigationStack {
            
            VStack{
                VStack{
                    Text("Inter your first Item price")
                        .font(Font.system(size:20))
                        .multilineTextAlignment(.leading)
                    TextField("Price for your product", text: $givenInput1)
                }
                VStack{
                    Text("Inter your Second Item price")
                            .font(Font.system(size:20))
                            .multilineTextAlignment(.leading)
                        TextField("Price for your product", text: $givenInput2)
                }
                VStack{
                    Text("Inter your Third Item price")
                            .font(Font.system(size:20))
                            .multilineTextAlignment(.leading)
                        TextField("Price for your product", text: $givenInput3)
                }
            }
            Button {
                checkTotalPrice()
            } label: {
                Text("Check Total Price")
            }
            .buttonStyle(.borderedProminent)
            
            VStack{
                Text(feedback)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 25.0,
                            relativeTo: .title3
                        )
                    )
                Text(feedback2)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 25.0,
                            relativeTo: .title3
                        )
                    )
            }
            
            
            
            
            
                
            
            
           
            
        }
        
    }
    
    func checkTotalPrice() {
        // Attempt to unwrap the first input provided by the user
        guard let firstInput = Double(givenInput1) else {
            feedback = "Please provide a Double for the Item."
            return
        }

        // Attempt to unwrap the second input provided by the user
        guard let secondInput = Double(givenInput2) else {
            feedback = "Please provide a Double for the Item."
            return
        }

        // Attempt to unwrap the third input provided by the user
        guard let thirdInput = Double(givenInput3) else {
            feedback = "Please provide a Double for the Item."
            return
        }

        // Calculate the total price
        let totalPrice = firstInput + secondInput + thirdInput

        // Calculate the total Tax
        let totalTax = (firstInput * tax) + (secondInput * tax) + ( thirdInput * tax)
        
        // Update the feedback
        feedback = "The total price is $\(totalPrice)"
        
        // feedback for the Tax
        feedback2 = "The total tax is $\(totalTax)"
    }
}
                
                
#Preview {
    CartView()
}
