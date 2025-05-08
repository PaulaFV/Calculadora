//
//  ViewControllerTest.swift
//  CalcSecondTry
//
//  Created by Paula Fernández Vázquez on 28/4/25.
//

import Foundation
import UIKit

class ViewControllerTest:
    UIViewController {
    @IBOutlet weak var CalculatorWorksLabel: UILabel!
    @IBOutlet weak var CalculatorResultLabel: UILabel!
    
    var model : ModelProtocol = ViewModel()
    var last = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.deleteAll()
        CalculatorResultLabel.text = ""
        updateView()
    }
    
    func updateView() {
        CalculatorWorksLabel.text = model.getExpression()
    }
    
    @IBAction func acButton(_ sender: Any) {
        model.deleteAll()
        CalculatorResultLabel.text = ""
        updateView()
    }
    
    @IBAction func deleteOne(_ sender: Any) {
        model.deleteLast()
        updateView()
    }
    
    @IBAction func percentageCalc(_ sender: Any) {
        if last {
            model.deleteAll()
            model.addToC("0")
            last = false
        }
        addToExpression("%")
    }
    
    @IBAction func divisionCalc(_ sender: Any) {
        if last {
            model.deleteAll()
            model.addToC(CalculatorResultLabel.text ?? "0")
            last = false
        }
        addToExpression("/")
    }
    
    @IBAction func timesCalc(_ sender: Any) {
        if last {
            model.deleteAll()
            model.addToC(CalculatorResultLabel.text ?? "0")
            last = false
        }
        addToExpression("*")
    }
    
    @IBAction func plusCalc(_ sender: Any) {
        if last {
            model.deleteAll()
            model.addToC(CalculatorResultLabel.text ?? "0")
            last = false
        }
        addToExpression("+")
    }
    
    @IBAction func minusCalc(_ sender: Any) {
        if last {
            model.deleteAll()
            model.addToC(CalculatorResultLabel.text ?? "0")
            last = false
        }
        addToExpression("-")
    }
    
    @IBAction func equalsCalc(_ sender: Any) {
        if let result = model.calculateResult() {
            CalculatorResultLabel.text = result
            model.deleteAll()
            model.addToC(result)
            updateView()
            last = true
        } else {
            showError()
        }
    }
    
    func showError() {
        let warning = UIAlertController(title: "Input Error", message: "Check your input.", preferredStyle: .alert)
        warning.addAction(UIAlertAction(title: "Okay", style: .default))
        present(warning, animated: true, completion: nil)
    }
    
    func addToExpression(_ text: String) {
        if last {
            model.deleteAll()
            last = false
        }
        model.addToC(text)
        updateView()
    }
    
    @IBAction func zeroCalcButton(_ sender: Any) {
        addToExpression("0")
    }
    
    @IBAction func oneCalcButton(_ sender: Any) {
        addToExpression("1")
    }
    
    @IBAction func twoCalcButton(_ sender: Any) {
        addToExpression("2")
    }
    
    @IBAction func threeCalcButton(_ sender: Any) {
        addToExpression("3")
    }
    
    @IBAction func fourCalcButton(_ sender: Any) {
        addToExpression("4")
    }
    
    @IBAction func fiveCalcButton(_ sender: Any) {
        addToExpression("5")
    }
    
    @IBAction func sixCalcButton(_ sender: Any) {
        addToExpression("6")
    }
    
    @IBAction func sevenCalcButton(_ sender: Any) {
        addToExpression("7")
    }
    
    @IBAction func eightCalcButton(_ sender: Any) {
        addToExpression("8")
    }
   
    @IBAction func nineCalcButton(_ sender: Any) {
        addToExpression("9")
    }
    
    @IBAction func dotCalcButton(_ sender: Any) {
        addToExpression(".")
    }
}
