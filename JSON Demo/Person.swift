//
//  Game.swift
//  JSON Demo
//
//  Created by Leonardo Schick on 1/27/16.
//  Copyright © 2016 Xicks. All rights reserved.
//

import UIKit

class Person: NSObject {

    var id: Int
    var name: String
    var username: String
    var address: Address
    var phone : String
    
    override init(){
        id = -1
        name = ""
        username = ""
        phone = ""
        address = Address()
    }
    
    init(id:Int,name:String,username:String,address:Address,phone:String) {
        self.id = id
        self.name = name
        self.username = username
        self.address = address
        self.phone = phone
    }
    
}
