

import UIKit

class ViewController: UIViewController {
   
    
    
    var billTotal = 0.0
    var tip = 0.10
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    
    @IBOutlet weak var billTextField: UITextField!
   
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!

    
    
    

    
    
    @IBAction func tipChange(sender: UIButton){
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
    }
    
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
       
        splitLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
   
    @IBAction func claculatePressed(_ sender: UIButton) {
        
            let bill = billTextField.text!
                    if bill != "" {
                        billTotal = Double(bill)!
                        let result = billTotal * (1 + tip) / Double(numberOfPeople)
                        finalResult = String(format: "%.2f", result)
                    }
            self.performSegue(withIdentifier: "goToResults", sender: self)
            
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                if segue.identifier == "goToResults" {
                    
                    let destinationVC = segue.destination as! ResultViewController
                    destinationVC.result = finalResult
                    destinationVC.tip = Int(tip * 100)
                    destinationVC.split = numberOfPeople
                }
            }
        
    }
    

