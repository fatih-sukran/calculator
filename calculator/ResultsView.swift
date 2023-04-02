//
//  ResultsView.swift
//  calculator
//
//  Created by Fatih Şükran on 1.04.2023.
//

import SwiftUI

struct ResultsView: View {
    @Binding var displayValue: [String]
    private var value: String {
        displayValue.joined(separator: " ")
    }
    
    var body: some View {
        VStack {
            Text(value)
                .font(.largeTitle)
                .foregroundColor(Color("ResultTextColor"))
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
                .background(Color("Color"))
                .cornerRadius(30)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var text = ["23", "*", "21", "-", "5"]
    
    static var previews: some View {
        ResultsView(displayValue: .constant(text))
    }
}
