//
//  LoginViewController.swift
//  LoginJoin
//
//  Created by Luca Park on 2022. 6. 6..
//

import UIKit

class LoginViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    @IBOutlet var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.text = ""
    }
    
    @IBAction func onBtnLogin(_ sender: UIButton) {
        let id = tfID.text
        let pw = tfPW.text
        
        if let safeID = id, let safePW = pw {
            //true: safeID와 safePW가 모두 nil이 아님. 정상
            if safeID.count < 3 || safePW.count < 4 {
                print("아이디 혹은 패스워드를 확인해 주세요.")
                warningLabel.text = "아이디 혹은 패스워드를 확인해 주세요."
                return
            }
            if safeID == appDelegate.userInfo.id && safePW == appDelegate.userInfo.pw {
                print("성공")
                appDelegate.userInfo.id = safeID
                appDelegate.userInfo.pw = safePW
                appDelegate.isLogin = true
            } else {
                print("아이디 혹은 패스워드 확인 요망")
                warningLabel.text = "아이디 혹은 패스워드를 확인해 주세요."
                return
            }
            
            
            self.navigationController?.popViewController(animated: true)
        } else {
            print("아이디 혹은 패스워드가 비어있습니다.")
            warningLabel.text = "아이디 혹은 패스워드가 비어있습니다."
        }
    }
    
}
