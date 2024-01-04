//
//  ViewController.swift

import UIKit
import Expression

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var str: String = ""
    var result: Double = 0
    
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
            str += sender.currentTitle!
//            if (sender.currentTitle!.contains(".")){
//                str += sender.currentTitle!
//            }else{
//                str += (sender.currentTitle! + ".0")
//            }
            
        }
        
        displayMe(s: sender.currentTitle!)
    }
    func displayMe(s: String){
        display.text! += s
    }
    @IBAction func equalTo(_ sender: UIButton) {
        // Using the Foundation API and NSExpression class
//        func evaluateExpression(_ expression: String) -> Double? {
//            let mathExpression = NSExpression(format: expression)
//            
//            if let result = mathExpression.expressionValue(with: nil, context: nil) as? Double {
//                str = String(result)
//                return result
//            } else {
//                print("Error evaluating expression")
//                return nil
//            }
//        }
 

        func evaluateExpression(_ expression: String) -> Double? {
            do {
                let exp = try Expression(expression)
                return try exp.evaluate()
            } catch {
                print("Error evaluating expression: \(error)")
                return nil
            }
        }
        if let result = evaluateExpression(str) {
            print("Result: \(result)")
            str = String(result)
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

