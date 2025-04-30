import Foundation

class ViewModel {
    
    private(set) var expression: String = ""

    func addToC(_ text: String) {
        if expression.isEmpty && text == "%" {
            return
        }
        
        if let lastChar = expression.last, "+-*/%".contains(lastChar), "+-*/%".contains(Character(text)) {
            return
        }
        expression += text
    }

    func deleteLast() {
        if !expression.isEmpty {
            expression.removeLast()
        }
    }

    func deleteAll() {
        expression = ""
    }

    func calculateResult() -> String? {
        guard validInput() else { return nil }
        
        let modifiedExpression = expression.replacingOccurrences(of: "%", with: "*0.01")
        let expressionWithDecimals = transformFullToDecimals(modifiedExpression)
        
        let nsExpression = NSExpression(format: expressionWithDecimals)
        
        if let result = nsExpression.expressionValue(with: nil, context: nil) as? Double {
            return resultFormat(result)
        }
        return nil
    }
    
    private func transformFullToDecimals(_ expression: String) -> String {
        let pattern = #"(?<![\d.])(\d+)(?![\d.])"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: expression.utf16.count)
        return regex.stringByReplacingMatches(in: expression, options: [], range: range, withTemplate: "$1.0")
    }

    private func resultFormat(_ result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(result))
        } else {
            return String(result)
        }
    }


    func getExpression() -> String {
        return expression
    }

    private func specialChar(_ char: Character) -> Bool {
        return "+-*/".contains(char)
    }

    private func validInput() -> Bool {
        var ind = [Int]()
        for (i, char) in expression.enumerated() {
            if specialChar(char) {
                ind.append(i)
            }
        }

        var previous = -1
        for index in ind {
            if (index == 0 && expression.first != "-") || index == expression.count - 1 {
                return false
            }

            if previous != -1 {
                let prev = expression[expression.index(expression.startIndex, offsetBy: previous)]
                let current = expression[expression.index(expression.startIndex, offsetBy: index)]

                if index - previous == 1 {
                    if current == "-" && (prev == "*" || prev == "/") {
                        continue
                    }
                    return false
                }
            }
            previous = index
        }
        return true
    }
}
