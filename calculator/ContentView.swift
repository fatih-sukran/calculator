//
//  ContentView.swift
//  calculator
//
//  Created by Fatih Şükran on 1.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var expressions: [String] = []
    @State var lastIsNum = true
    
    var body: some View {
        VStack(spacing: 12) {
            ResultsView(displayValue: $expressions)
            HStack(spacing: 12) {
                ButtonView(buttonText: "AC", color:Color("Accent2Color"))  {
                    clear()
                }
                ButtonView(buttonText: "DEL", color:Color("Accent2Color"))  {
//                    appendDigit("")
                }
                ButtonView(buttonText: "%", color:Color("Accent2Color"))  {
//                    appendDigit("")
                }
                ButtonView(buttonText: "/", color:Color("AccentColor"))  {
                    appendDigit(" / ")
                }
            }
            HStack(spacing: 12) {
                ButtonView(buttonText: "7")  {
                    appendDigit("7")
                }
                ButtonView(buttonText: "8")  {
                    appendDigit("8")
                }
                ButtonView(buttonText: "9")  {
                    appendDigit("9")
                }
                ButtonView(buttonText: "x", color:Color("AccentColor"))  {
                    appendDigit("*")
                }
            }
            HStack(spacing: 12) {
                ButtonView(buttonText: "4")  {
                    appendDigit("4")
                }
                ButtonView(buttonText: "5")  {
                    appendDigit("5")
                }
                ButtonView(buttonText: "6")  {
                    appendDigit("6")
                }
                ButtonView(buttonText: "-", color:Color("AccentColor"))  {
                    appendDigit(" - ")
                }
            }
            HStack(spacing: 12) {
                ButtonView(buttonText: "1")  {
                    appendDigit("1")
                }
                ButtonView(buttonText: "2")  {
                    appendDigit("2")
                }
                ButtonView(buttonText: "3")  {
                    appendDigit("3")
                }
                ButtonView(buttonText: "+", color:Color("AccentColor"))  {
                    appendDigit(" + ")
                }
            }
            HStack(spacing: 12) {
                ButtonView(buttonText: "0", size: 1.81) {
                    appendDigit("0")
                }

                ButtonView(buttonText: ".", size: 1.21) {
                    appendDigit(".")
                }
                ButtonView(buttonText: "=", color:Color("AccentColor"), size: 1.21)  {
                   solve()
                }
            }
        }
        .padding()
    }
    
    private func clear() {
        expressions.removeAll()
    }
    
    private func appendDigit(_ digit:String) {
        let num = Int(digit)
        
        if let last = expressions.last {
            if (lastIsNum && (num != nil) ) {
                expressions[expressions.count - 1] = last + digit
            } else if (!lastIsNum && num != nil) {
                expressions.append(digit)
                lastIsNum = true
            } else if (lastIsNum && num == nil) {
                expressions.append(digit)
                lastIsNum = false
            } else if (!lastIsNum && num == nil) {
                expressions[expressions.count - 1] = digit;
            }
        } else if (num != nil){
            expressions.append(digit)
        }
    }


    
    private func solve() {
        print("joined: " + expressions.joined())
        let newExpression = convertFloat()
        print("newExpression: " + newExpression.joined())
        let expression = NSExpression(format: newExpression.joined())
        print("expression: \(expression)")
        let result = expression.expressionValue(with: nil, context: nil) as? Double
        print("result: \(String(describing: result))")
        clear()
        if let validResult = result {
            expressions.append(String(round(validResult, toPlaces: 5)))
        } else {
            expressions.append("INVALID_EXPRESSION")
        }
    }
    
    private func convertFloat() -> [String] {
        var newExpression: [String] = []
        for i in 0..<expressions.count {
            newExpression.append(expressions[i])
            if (Float(expressions[i]) != nil && !expressions[i].contains(".")) {
                newExpression[i].append(".0")
            }
        }
        return newExpression
    }
    
    private func round(_ number: Double, toPlaces places: Int) -> Double {
        let factor = pow(10, Double(places))
        return (number * factor).rounded() / factor
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(Color("BackgroundColor"))
            .statusBarHidden(false)
    }
}
