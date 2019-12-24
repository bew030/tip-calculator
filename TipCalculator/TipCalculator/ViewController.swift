//
//  ViewController.swift
//  TipCalculator
//
//  Created by Bernard Wong on 12/22/19.
//  Copyright © 2019 Bernard Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // outlets
    // user input fields
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var taxField: UITextField!
    
    // tip percentage manipulators
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    @IBOutlet weak var sliderPercentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    // output labels
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var billSplits: [UILabel]!
   
    // variables
    var tip = 0.0
    var return_tip = ""
    var total = 0.0
    var return_total = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // code ensures that the keyboard gets loaded up and stays on screen so that the user can quickly perform calculations
        self.billField.becomeFirstResponder()
    }
    
    /**
     This method performs the right actions once the quick select tip buttons are selected from the segmented control. It sets the tip slider to the right location, changes the background accordingly, and upgrades the tip, total, and bill splits.
     - Returns: nothing
     */
    @IBAction func tipPercentageTap(_ sender: Any) {
        // gets percentage of the selected segment
        let tip_selection: String = tipPercentSegment.titleForSegment(at: tipPercentSegment.selectedSegmentIndex)!
        // removes the percentage and typecasts into a double
        let tip_percentage = Float(tip_selection.replacingOccurrences(of: "%", with: ""))!
        // sets slider and percentage label to correct value
        tipSlider.setValue(roundf(tip_percentage), animated: true)
        sliderPercentageLabel.text = String(format: "%.f%%", tipSlider.value)
        
        // updates background
        updateBackground(externalPercent: Double(roundf(tipSlider.value)))
        // updates tip, total, and split bill
        update_tip_total_split(externalTip: Double(roundf(tipSlider.value)))
    }
    
    /**
     This method performs the right actions once the tip percentage slider is moved. It rounds the tip percentage (since we're assuming tips will always be discrete), changes the background accordingly, and upgrades the tip, total, and bill splits.
     - Returns: nothing
     */
    @IBAction func calculateTipSlider(_ sender: Any) {
        // rounds the percentage of the tip to a whole number
        let tip_percentage = roundf(tipSlider.value)
        // labels the tip percentage accordingly
        sliderPercentageLabel.text = String(format: "%.f%%", tip_percentage)
        
        // updates background
        updateBackground(externalPercent: Double(tip_percentage))
        // updates tip, total, and split bill
        update_tip_total_split(externalTip: Double(tip_percentage))
    }
    
    /**
     This method calculates the tip, total, and split bill amounts and then updates labels accordingly.
     - Parameters:
        - externalTip: The tip percentage
     - Returns: nothing
     */
    func update_tip_total_split(externalTip internalTip: Double) {
        // collects user input (the bill amount and the tax amount)
        let amount = Double(billField.text!) ?? 0
        let taxAmount = Double(taxField.text!) ?? 0
        
        // calculates the tip and total amount while also modifying the labels for the return tip and total
        tip = amount * Double(internalTip/100)
        return_tip = String(format: "$%.2f", tip)
        total = amount + tip + taxAmount
        return_total = String(format: "$%.2f",total)
               
        // update the tip and total labels
        tipLabel.text = "\(return_tip)"
        totalLabel.text = "\(return_total)"
        let billSplitAmounts = [total/2,total/3,total/4,total/5]
        for i in 0..<billSplits.count {
            billSplits[i].text = String(format: "$%.2f",billSplitAmounts[i])
        }
    }
    
    /**
     This method changes the background of the app depending on the tip percentage. It's meant to symbolize the tip percentage visually (where if tip is bad change background to red, tip is average change background to yellow, and tip is good change background to green).
     - Parameters:
        - externalTip: The tip percentage
     - Returns: nothing
     */
    func updateBackground(externalPercent internalPercent: Double) {
        if internalPercent <= 10 {
            self.view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }
        else if internalPercent < 20 {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        }
        else {
            self.view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        }
    }
}
