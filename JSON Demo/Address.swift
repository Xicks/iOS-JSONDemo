//
//  Address.swift
//  JSON Demo
//
//  Created by Leonardo Schick on 9/23/16.
//  Copyright © 2016 Xicks. All rights reserved.
//

import UIKit

class Address : NSObject {
    
    var street: String
    var suite: String
    var city: String
    var zipcode : String
    
    override init(){
        street = ""
        suite = ""
        city = ""
        zipcode = ""
    }
    
    init(street:String,suite:String,city:String,zipcode:String){
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }
    
}
