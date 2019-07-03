//
//  LoginViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let lowerCasedEmail = txtEmail.text!.lowercased()
        
        if UserSingleton.riderMailExist(mail: self.txtEmail.text!){
            let rider = UserSingleton.getRiderByMail(mail: lowerCasedEmail)
            UserSingleton.activeRider = rider!
        }else{
            let alert = UIAlertController(title: "Invalid Credentials", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self.present(alert, animated: true, completion: nil)
                }
        }
    }

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
