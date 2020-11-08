

import UIKit

class ViewController: UIViewController {
   
    
    
   
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
 
    @IBOutlet weak var twentyPctButton: UIButton!
    
   
    @IBOutlet weak var splitLabel: UILabel!
    var numberOfPeople = 2
    
    
    @IBAction func tipChange(sender: UIButton){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        
        sender.isSelected = true
    }
    
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
   
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(numberOfPeople)
    }
    

}

