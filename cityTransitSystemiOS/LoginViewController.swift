//
//  LoginViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var imgViewBG: UIImageView!
    
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    //geting userdefault reference
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getRememberMeValues()
        
        //show gif file
        imgViewBG.loadGif(name: "stars")
        // Do any additional setup after loading the view.
    }
    
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmail")
        {
            txtEmail.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txtPassword.text = pwd
                switchRememberMe.setOn(true, animated: false)
            }
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let lowerCasedEmail = txtEmail.text!.lowercased()
        
        Auth.auth().signIn(withEmail: lowerCasedEmail, password: self.txtPassword.text!) { [weak self] user, error in
            //guard let strongSelf = self else { return }
            // ...
            if error == nil{
                
                //implementing user defaults to remember details
                
                let userDefault = UserDefaults.standard
                if self!.switchRememberMe.isOn
                {
                    
                    userDefault.setValue(self!.txtEmail.text, forKey: "userEmail")
                    userDefault.set(self!.txtPassword.text, forKey: "userPassword")
                }
                else
                {
                    userDefault.removeObject(forKey: "userEmail")
                    userDefault.removeObject(forKey: "userPassword")
                }
                
                if (self?.txtEmail.text == "admin@routes.com") // check if admin email
                {
                    //perform segue on condition
                    self?.performSegue(withIdentifier: "adminHomeS", sender: nil)
                    
                } else{
                    //perform segue on condition
                    self?.performSegue(withIdentifier: "riderHomeS", sender: nil)
                    
                }
                } else {
                let alert = UIAlertController(title: "Invalid Credentials", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self!.present(alert, animated: true, completion: nil)
                }
            
        }
        
//        if UserSingleton.riderMailExist(mail: lowerCasedEmail){
//            let rider = UserSingleton.getRiderByMail(mail: lowerCasedEmail)
//            UserSingleton.activeRider = rider!
//        }else{
//            let alert = UIAlertController(title: "Invalid Credentials", message: "", preferredStyle: UIAlertController.Style.actionSheet)
//                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//                    alert.addAction(actionOk)
//                    self.present(alert, animated: true, completion: nil)
//                }
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
