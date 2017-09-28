//
//  ViewController.swift
//  Exercise2
//
//  Created by Dinesh on 9/13/17.
//  Copyright © 2017 cpl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RegisterViewControllerDelegate {

    var usersDict:[String:String] = ["admin":"admin"]
    var enteredUsername:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        lblError.isHidden = true
        lblUsername.text = ""
        lblPassword.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lblUsername: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    @IBAction func checkValidUser(_ sender: Any) {
        enteredUsername = self.lblUsername.text
        
        if ( usersDict[enteredUsername!] == self.lblPassword.text! ) {
            lblError.isHidden = true
            self.performSegue(withIdentifier: "login2Home", sender: self)
        } else {
            lblError.isHidden = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "login2Home") {
            let dvc = segue.destination as! HomeViewController
            dvc.user = enteredUsername!
        } else if(segue.identifier == "login2Register") {
            let dvc = segue.destination as! RegisterViewController
            dvc.delegate = self
        }
    }
    
    func registerViewControllerResponse(username:String, password:String) {
        usersDict[username] = password
    }

}

