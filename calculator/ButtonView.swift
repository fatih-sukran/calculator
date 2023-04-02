//
//  ButtonView.swift
//  calculator
//
//  Created by Fatih Şükran on 1.04.2023.
//

import SwiftUI

struct ButtonView: View {
    let buttonText:String
    var color = Color("NumberColor")
    var size:Float = 1
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text(buttonText)
                .font(.largeTitle)
                .foregroundColor(Color("ButtonTextColor"))
                .frame(maxWidth: 91 * CGFloat(size), maxHeight: 75)
                .background(color)
                .cornerRadius(21)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "2"){}
    }
}
