//
//  global.swift
//  TipTab
//
//  Created by MACLaptop on 9/29/16.
//  Copyright © 2016 MACVivis. All rights reserved.
//

import Foundation

class Main {
    var name:String
    var tip:String
    init(name:String,tip:String) {
        self.name = name
        self.tip = tip
    }

}
var mainInstance = Main(name:"My Global Class", tip:"0")
var defaults = UserDefaults.standard
