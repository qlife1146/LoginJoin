//
//  ViewController.swift
//  LoginJoin
//
//  Created by Luca Park on 2022. 6. 6..
//

import UIKit

class MainViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet var labelLoginStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLoginStatus.text = "OFF"
    }

    override func viewWillAppear(_ animated: Bool) {
        if appDelegate.isLogin {
            labelLoginStatus.text = "ON\nWelcome \(appDelegate.userInfo.name)!"
        } else {
            labelLoginStatus.text = "LOGOUT"
        }
    }

}
