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
    
    // History of calculations
     @State var calculationHistory: [String] = []
    
    
    
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Use this app to calculated your item total Price and Tax")
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 30.0
                        )
                    )
                    .padding()
                VStack(alignment: .leading) {
                    Text("Enter your first Item price")
                        .font(Font.system(size: 20))
                        .multilineTextAlignment(.leading)
                    TextField("Price for your product", text: $givenInput1)
                }
                VStack(alignment: .leading) {
                    Text("Enter your Second Item price")
                        .font(Font.system(size: 20))
                        .multilineTextAlignment(.leading)
                    TextField("Price for your product", text: $givenInput2)
                }
                VStack(alignment: .leading) {
                    Text("Enter your Third Item price")
                        .font(Font.system(size: 20))
                        .multilineTextAlignment(.leading)
                    TextField("Price for your product", text: $givenInput3)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            HStack {
                Button {
                    checkTotalPrice()
                } label: {
                    Text("Check Total Price/Tax")
                        .font(Font.system(size: 15))
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Button {
                    calculationHistory.removeAll()
                } label: {
                    Text("Reset")
                        .font(Font.system(size: 15))
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            VStack {
                Text(feedback)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 25.0
                            
                        )
                    )
                Text(feedback2)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 25.0
                        )
                    )
            }
            
        
            Divider()
                .padding()
            Text("Calculating History")
                .font(
                    .custom(
                        "BradleyHandITCTT-Bold",
                        size: 30.0
                    )
                )
            
            ScrollView {
                VStack(spacing: 5) {
                    ForEach(calculationHistory, id: \.self) { currentcalculation in
                        Text("\(currentcalculation)")
                        Divider()
                    }
                }
            }
            
                       
            
            
                .navigationTitle("Price/Tax Calculator")
            Spacer()
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
            
        
        // Format the total price and total tax to 2 decimal places
    let formattedTotalPrice = totalPrice.formatted(.currency(code: "CAD"))
    let formattedTotalTax = totalTax.formatted(.currency(code: "CAD"))
            
        
        // Create a history entry string
        let historyEntry = "Price: $\(formattedTotalPrice), Tax: $\(formattedTotalTax)"
        
        // Append the history entry to the calculation history
        calculationHistory.append(historyEntry)
        
        
        // Update the feedback
        feedback = "The total price is $\(formattedTotalPrice)"
        

        // feedback for the Tax
        feedback2 = "The total tax is $\(formattedTotalTax )"
        
    }
    
    func reset() {
        // Reset the text fields
        givenInput1 = ""
        givenInput2 = ""
        givenInput3 = ""
        
        // Reset feedback messages
        feedback = ""
        feedback2 = ""
    }
}
#Preview {
    CartView()
}
