//
//  ViewController.swift
//  JSON Demo
//
//  Created by Leonardo Schick on 1/27/16.
//  Copyright © 2016 Xicks. All rights reserved.
//

import UIKit

var activePerson : Person = Person()
class ViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = activePerson.name
        self.usernameLabel.text = activePerson.username
        
        let urlString = "https://jsonplaceholder.typicode.com/users/\(activePerson.id)"
        
        let url = NSURL(string:urlString)!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if let urlContent = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        activePerson.phone = json["phone"] as! String
                        let address = Address()
                        address.street = json["address"]?!["street"] as! String
                        address.suite = json["address"]?!["suite"] as! String
                        address.city = json["address"]?!["city"] as! String
                        address.zipcode = json["address"]?!["zipcode"] as! String
                        activePerson.address = address
                        
                        self.addressLabel.text = address.street + "\n" + address.suite + "\n" + address.city + "\n" +
                            address.zipcode + "\n" + activePerson.phone
                    })
                } catch {
                    print("JSON not serializable")
                    self.addressLabel.text = "Address not found!"
                }
            }
        }
        task.resume()
        // Do any additional setup after loading the view. 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
