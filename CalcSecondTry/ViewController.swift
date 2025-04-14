//
//  ViewController.swift
//  CalcSecondTry
//
//  Created by Paula Fernández Vázquez on 11/4/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var CalculadoraWorks: UILabel!
    @IBOutlet weak var CalculadoraResult: UILabel!
    
    var calculos: String = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        borrarTodo()
    }
    
    func borrarTodo() {
        calculos = ""
        CalculadoraResult.text = ""
        CalculadoraWorks.text = ""
    }

    @IBAction func acButton(_ sender: Any) {
        borrarTodo()
    }
    
    @IBAction func borrarUno(_ sender: Any) {
        if !calculos.isEmpty {
            calculos.removeLast()
            CalculadoraWorks.text = calculos
        }

    }
    
    @IBAction func porcentajeCalc(_ sender: Any) {
        añadirAWorks("%")
    }
    
    func añadirAWorks(_ texto: String) {
        calculos += texto
        CalculadoraWorks.text = calculos
    }
    
    @IBAction func divisionCalc(_ sender: Any) {
        añadirAWorks("/")
    }
    @IBAction func multiplicacionCalc(_ sender: Any) {
        añadirAWorks("*")
    }
    
    @IBAction func restaCalc(_ sender: Any) {
        añadirAWorks("-")
    }
    
    @IBAction func sumaCalc(_ sender: Any) {
        añadirAWorks("+")
    }
    
    @IBAction func igualCalc(_ sender: Any) {
        if(inputValido()){
            let checkCalculosPorcentaje = calculos.replacingOccurrences(of: "%", with: "*0.01")
            let Expression = NSExpression(format: checkCalculosPorcentaje)

            let result: Double = Expression.expressionValue(with: nil, context: nil) as! Double
           let resultadoString = formatearreResultado(result)
            CalculadoraResult.text = resultadoString
        }else {
            let alerta = UIAlertController(title: "Error en la entrada", message: "Verifica que la entrada sea correcta", preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Okay", style: .default,))
            self.present(alerta, animated: true, completion: nil)
        }
        
        
    }
    
    func inputValido() -> Bool {
        var contador = 0
        var funcCharIndexes = [Int]()
        
        for char in calculos {
            if(caracterEspecial(char: char)) {
                funcCharIndexes.append(contador)
            }
            contador+=1
        }
        
        var anterior: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0) || (index == calculos.count-1) {
                return false
            }
            
            if(anterior != -1) {
                if(index - anterior == 1) {
                    return false
                }
            }
            anterior = index
        }
        
        return true
    }
    
    func caracterEspecial(char: Character) -> Bool {
        if(char == "*") || (char == "/") || (char == "+") || (char == "-") {
            return true
        }
        return false
    }
    
    func formatearreResultado(_ result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }else {
            return String(format: "%.5f", result)
        }
    }
    
    @IBAction func sieteCalc(_ sender: Any) {
        añadirAWorks("7")
    }
    
    @IBAction func ochoCalc(_ sender: Any) {
        añadirAWorks("8")
    }
    
    
    @IBAction func nueveCalc(_ sender: Any) {
        añadirAWorks("9")
    }
    
    
    @IBAction func cuatroCalc(_ sender: Any) {
        añadirAWorks("4")
    }
    
    
    @IBAction func cincoCalc(_ sender: Any) {
        añadirAWorks("5")
    }
    
    
    @IBAction func seisCalc(_ sender: Any) {
        añadirAWorks("6")
    }
    
    
    @IBAction func unoCalc(_ sender: Any) {
        añadirAWorks("1")
    }
    
    
    @IBAction func dosCalc(_ sender: Any) {
        añadirAWorks("2")
    }
    
    
    @IBAction func tresCalc(_ sender: Any) {
        añadirAWorks("3")
    }
    
    
    @IBAction func puntoCalc(_ sender: Any) {
        añadirAWorks(".")
    }
    
    
    @IBAction func ceroCalc(_ sender: Any) {
        añadirAWorks("0")
    }
}

