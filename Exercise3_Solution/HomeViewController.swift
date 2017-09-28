//
//  HomeViewController.swift
//  Exercise2
//
//  Created by Dinesh on 9/13/17.
//  Copyright © 2017 cpl. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var user:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblName.text = user
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated./Volumes/ubicomp/fall 2016/Week2/Exercise2solution.zip
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actionLogout(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var lblName: UILabel!
}
