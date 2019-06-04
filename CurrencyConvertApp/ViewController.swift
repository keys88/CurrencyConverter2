//
//  ViewController.swift
//  CurrencyConvertApp
//
//  Created by Kennon Keys Ward on 6/3/19.
//  Copyright © 2019 Kennon Keys Ward. All rights reserved.
//

import UIKit

enum CurrencyType: String {
    case cad = "Currency (CAD)"
    case peso = "Currency (Peso)"
}


class ViewController: UIViewController {
    
    var currencyType: CurrencyType?
    
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        var convertedCurrency = 0.0
        if unit == CurrencyType.cad {
            convertedCurrency = dollars * 1.34
        } else {
            convertedCurrency = dollars * 19.77
        }
      
        return convertedCurrency
    }
    
    
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    
    @IBOutlet weak var cadButton: UIButton!
    
    
    @IBOutlet weak var pesoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if toCurrencyLabel.text == "Currency (CAD)" {
            currencyType = .cad
        } else if toCurrencyLabel.text == "Currency (Peso)" {
            currencyType = .peso
        }
    }
    

    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let fromCurrency = fromCurrencyTextField.text,
        let fromAmount = Double(fromCurrency),
        let currency = currencyType else {
            toCurrencyTextField.text = "0.0"
            return
            
        }
        let changoToString = convert(dollars: fromAmount, to: currency)
        toCurrencyTextField.text = String(changoToString)
    }
    
    
    
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        toCurrencyLabel.text = "Currency (CAD)"
        
    }
    
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        toCurrencyLabel.text = "Currency (Peso)"
    }
    
    
}

