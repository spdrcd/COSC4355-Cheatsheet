//
//  RegisterViewController.swift
//  Exercise2
//
//  Created by Dinesh on 9/13/17.
//  Copyright © 2017 cpl. All rights reserved.
//

import UIKit

protocol RegisterViewControllerDelegate {
    func registerViewControllerResponse(username:String, password:String)
}

class RegisterViewController: UIViewController {

    var delegate: RegisterViewControllerDelegate?
    
    @IBOutlet weak var txtNewUser: UITextField!
    @IBOutlet weak var txtNewPwd: UITextField!
    @IBOutlet weak var txtConfirmPwd: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        txtNewUser.text = ""
        txtNewPwd.text = ""
        txtConfirmPwd.text = ""
        lblError.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        delegate?.registerViewControllerResponse(username: txtNewUser.text!, password: txtNewPwd.text!)
        if segue.identifier == "register2Home" {
            let dvc = segue.destination as! HomeViewController
            dvc.user = txtNewUser.text!
        }
    }
    
    @IBAction func addNewUser(_ sender: Any) {
        
        if (txtNewUser.text != "" && txtNewPwd.text != "" && txtNewPwd.text == txtConfirmPwd.text) {
            lblError.text = ""
            performSegue(withIdentifier: "register2Home", sender: self)
        } else if (txtNewUser.text == "") {
            lblError.text = "Username cannot be empty"
        } else if (txtNewPwd.text == "") {
            lblError.text = "Password cannot be empty"
        } else if (txtNewPwd != txtConfirmPwd) {
            lblError.text = "Passwords do not match"
        }
    }

}
