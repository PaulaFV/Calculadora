//
//  ModelProtocol.swift
//  CalcSecondTry
//
//  Created by Paula Fernández Vázquez on 30/4/25.
//

import Foundation


protocol ModelProtocol {
    func addToC(_ text: String)
    func deleteLast()
    func deleteAll()
    func calculateResult() -> String?
    func getExpression() -> String
}
