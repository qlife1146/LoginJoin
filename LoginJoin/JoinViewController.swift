//
//  JoinViewController.swift
//  LoginJoin
//
//  Created by Luca Park on 2022. 6. 6..
//

import UIKit

class JoinViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var labelAgreeCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelAgreeCheck.text = "약관 동의를 하지 않았습니다."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnAccept(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if appDelegate.isAgree == false {
            print("약관 동의가 필요합니다.")
            return
        }
        
        let id = tfID.text
        let pw = tfPW.text
        let name = tfName.text
        let phone = tfPhone.text
        
        if let safeId = id, let safePW = pw, let safeName = name, let safePhone = phone {
            print("입력에 문제가 있습니다.")
            if safeId.count < 3 {
                print("아이디 입력해 주세요.")
                return
            }
            if safePW.count < 4 {
                print("비밀번호 입력해 주세요.")
                return
            }
            if safeName.count < 2 {
                print("이름 입력해 주세요.")
                return
            }
            if safePhone.count < 10 {
                print("전화번호 입력해 주세요.")
                return
            }
            
            appDelegate.userInfo.id = safeId
            appDelegate.userInfo.pw = safePW
            appDelegate.userInfo.name = safeName
            appDelegate.userInfo.phone = safePhone
            print("회원가입 완료")
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if appDelegate.isAgree == false {
            labelAgreeCheck.text = "약관 동의를 하지 않았습니다."
        } else if appDelegate.isAgree == true {
            labelAgreeCheck.text = "약관 동의를 하셨습니다."
        }
    }
    
}
