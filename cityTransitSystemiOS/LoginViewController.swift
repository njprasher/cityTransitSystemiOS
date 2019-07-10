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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show gif file
        imgViewBG.loadGif(name: "stars")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let lowerCasedEmail = txtEmail.text!.lowercased()
        
        Auth.auth().signIn(withEmail: lowerCasedEmail, password: self.txtPassword.text!) { [weak self] user, error in
            //guard let strongSelf = self else { return }
            // ...
            if error == nil{
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
