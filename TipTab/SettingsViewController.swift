//
//  SettingsViewController.swift
//  TipTab
//
//  Created by MACLaptop on 9/29/16.
//  Copyright © 2016 MACVivis. All rights reserved.
//

import UIKit



class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {


    @IBOutlet var SettingsView: UIView!
    @IBOutlet weak var pickerViewTip: UIPickerView!
    @IBOutlet weak var PickerViewColor: UIPickerView!
    let defaults = UserDefaults()
    let pickerDataSource = ["18%","20%","25%"]
    let pickerDataSourceColor = ["Gold","Green","Orange", "Dark Pink"]
    override func viewDidLoad() {
        let myColor = UIColor(
            red: 0xff/255,
            green: 0xee/255,
            blue: 0xb0/255,
            alpha: 1.0)
        super.viewDidLoad()
        self.SettingsView.backgroundColor =  myColor;
        // Do any additional setup after loading the view.
        self.pickerViewTip.dataSource = self;
        self.pickerViewTip.delegate = self;
        self.PickerViewColor.dataSource = self;
        self.PickerViewColor.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pickerViewTip {
            //pickerView1
            return 1;
        } else if pickerView == PickerViewColor{
            //pickerView2
            return 1;
        }
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       if pickerView == pickerViewTip {
            return pickerDataSource.count;
        }else if pickerView == PickerViewColor{
            return pickerDataSourceColor.count;
    }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if pickerView == pickerViewTip {
            return pickerDataSource[row]
        } else if pickerView == PickerViewColor{
            return pickerDataSourceColor[row]
        }
        return "0"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == pickerViewTip {
            defaults.set(row, forKey: "tipDefault")
        } else if pickerView == PickerViewColor{
            defaults.set(row, forKey: "background")
        }
        

    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tipDef = defaults.integer(forKey:"tipDefault")
        pickerViewTip.selectRow(tipDef, inComponent: 0, animated: true)
        let color = defaults.integer(forKey:"background")
        PickerViewColor.selectRow(color, inComponent: 0, animated: true)

      
        
    }

}
