//
//  GlobalDisplayEnv.swift
//  cacl
//
//  Created by Михаил  Галицкий on 08.01.2022.
//

import Foundation
import SwiftUI
import MathKit

class GlobalDisplayEnv: ObservableObject {
    @Published var result = "0"
    
    let system = System()
    
    func inputAction(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .ac: result = "0"
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .minus, .plus, .multiply, .divide:
            if result != "0" {
                    self.result += calculatorButton.title
                } else {
                    self.result = calculatorButton.title
                }
            case .decimal:
                self.result += calculatorButton.title
        case .plusMinus:
            let plusMinus = "-(\(self.result))"
            let resultMathKit = try! Expression(string: plusMinus, system: system).evaluate()
            self.result = String(describing: resultMathKit)
        case .percent:
            let percent = "(\(self.result))/100"
            let percentMathKit = try! Expression(string: percent, system: system).evaluate()
            self.result = String(describing: percentMathKit)
        case .equals:
            let equals = try! Expression(string: result, system: system).evaluate()
            self.result = String(describing: equals)
            default:
                break
            }
        }
    }
