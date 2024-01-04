//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var str: String = ""
    var result: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickedMe(_ sender: UIButton) {
        
        print("pressed me!")
        print(sender.currentTitle!)
        if sender.currentTitle == "×"{
            str += "*"
        }else if sender.currentTitle == "÷"{
            str += "/"
        }else{
            str += (sender.currentTitle!)
        }
        
        displayMe(s: sender.currentTitle!)
    }
    func displayMe(s: String){
        display.text! += s
    }
    @IBAction func equalTo(_ sender: UIButton) {
        // Using the Foundation API and NSExpression class
        func evaluateExpression(_ expression: String) -> Double? {
            let mathExpression = NSExpression(format: expression)
            
            if let result = mathExpression.expressionValue(with: nil, context: nil) as? Double {
                return result
            } else {
                print("Error evaluating expression")
                return nil
            }
        }
        
        if let result = evaluateExpression(str) {
            print("Result: \(result)")
            display.text = String(result)
        } else {
            print("Failed to evaluate expression")
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        str = ""
        result = 0
        display.text = str
    }
    
}

