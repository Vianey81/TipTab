//
//  ViewController.swift
//  TipTab
//
//  Created by MACLaptop on 9/29/16.
//  Copyright © 2016 MACVivis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var billView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.resultView.layer.cornerRadius = 10
        self.billView.layer.cornerRadius = 10
        self.resultView.layer.borderWidth = 1
        billText.delegate = self
        self.resultView.layer.borderColor = UIColor(red:0xff/255.0, green:0xee/255.0, blue:0xb0/255.0, alpha: 1.0).cgColor
        self.billView.layer.borderWidth = 1
        self.billView.layer.borderColor = UIColor(red:0xff/255.0, green:0xee/255.0, blue:0xb0/255.0, alpha: 1.0).cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billText.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        let split = total / Double(splitControl.selectedSegmentIndex + 1)
        splitTotal.text = String(format: "$%.2f ea.", split)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = defaults.integer(forKey:"tipDefault")
        calculateTip(self)
        let back = defaults.integer(forKey:"background")
        changeBackground(color: back)
        billText.becomeFirstResponder()
        self.billView.alpha = 0
        self.resultView.alpha = 0
        UIView.animate(withDuration: 0.9, animations: {
            // This causes first view to fade in and second view to fade out
            self.billView.alpha = 1
            self.resultView.alpha = 1
        })
        
    }
    func changeBackground(color: Int) -> Int {
        var myColor = UIColor()
        let myFontColor = UIColor(
            red: 0xff/255,
            green: 0xee/255,
            blue: 0xb0/255,
            alpha: 1.0)
        
        if color == 0 {
             myColor = UIColor(
                red: 0xd1/255,
                green: 0xc2/255,
                blue: 0x31/255,
                alpha: 1.0)

        } else if color == 1 {
             myColor = UIColor(
                red: 0xa2/255,
                green: 0xd4/255,
                blue: 0x9f/255,
                alpha: 1.0)

        }else if color == 2 {
             myColor = UIColor(
                red: 0xf2/255,
                green: 0x62/255,
                blue: 0x47/255,
                alpha: 1.0)

        }else if color == 3 {
             myColor = UIColor(
                red: 0xec/255,
                green: 0x20/255,
                blue: 0x45/255,
                alpha: 1.0)
            
        }
        self.resultView.backgroundColor =  myColor;
        self.billView.backgroundColor = myColor;
        self.tipControl.backgroundColor = myColor;
        self.tipControl.tintColor = myFontColor;
        self.splitControl.backgroundColor = myColor;
        self.splitControl.tintColor = myFontColor;
        return 0
    }


}


