//
//  AgreeViewController.swift
//  LoginJoin
//
//  Created by Luca Park on 2022. 6. 6..
//

import UIKit

class AgreeViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onSwitchAgree(_ sender: UISwitch) {
        if sender.isOn {
            appDelegate.isAgree = true
            //DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.navigationController?.popViewController(animated: true)
            //}
        } else {
            appDelegate.isAgree = false
        }
    }
    @IBAction func onBtnOk(_ sender: UIButton) {
        if appDelegate.isAgree == false {
            print("약관 동의가 필요합니다.")
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
