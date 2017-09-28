//
//  ViewController.swift
//  Exercise2
//
//  Created by Ashik Khatri on 8/29/17.
//  Copyright © 2017 Ashik Khatri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let greetingsDictionary = ["English": "Hello", "Italian": "Ciao", "French": "Bonjour", "Spanish": "Hola", "Dutch": "Hallo", "Greek": "Χαίρετε", "Vietnamese": "xin chào", "Chinese": "你好", "Bangla": "হ্যালো", "Hindi": "नमस्ते"]
    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var txtNameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Missing Name", message: "Enter your name!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: "Default action"), style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionGreetMe(_ sender: Any) {
        guard txtNameField.text!.characters.count > 0 else {
            showAlert()
            return
        }
        let randomNum = Int(arc4random_uniform(UInt32(greetingsDictionary.count)))
        lblGreeting.text = Array(greetingsDictionary.values)[randomNum] + " " + txtNameField.text!
    }

    @IBAction func actionPickAGreeting(_ sender: Any) {
        guard txtNameField.text!.characters.count > 0 else {
            showAlert()
            return
        }
        let alert = UIAlertController(title: "Greetings ActionSheet", message: "Pick greeting language", preferredStyle: .actionSheet)
        for (language, value) in greetingsDictionary {
            alert.addAction(UIAlertAction(title: NSLocalizedString(language, comment: "Default action"), style: .default, handler: { _ in
                self.lblGreeting.text = value + " " + self.txtNameField.text!
            }))
        }
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)

    }
}

