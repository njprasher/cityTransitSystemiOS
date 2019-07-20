//
//  EditProfileViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-17.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class EditProfileViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Change", style: UIBarButtonItem.Style.plain, target: self, action: #selector(   self.changePassword))
        self.navigationItem.rightBarButtonItem = rightButton
        // Do any additional setup after loading the view.
    }
    
    @objc func changePassword(){
        
        Auth.auth().signIn(withEmail: (Auth.auth().currentUser?.email)!, password: self.txtPassword.text!) { [weak self] user, error in
            //guard let strongSelf = self else { return }
            // ...
            if error == nil{
                
                if self!.txtNewPassword.text == self!.txtConfirmPassword.text{
                    Auth.auth().currentUser?.updatePassword(to: (self?.txtConfirmPassword.text)!) { (error) in
                        // ...
                    }
                    let alert = UIAlertController(title: "Password changed successfully", message: "", preferredStyle: UIAlertController.Style.alert)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (actionOK) in
                        self?.navigationController?.popViewController(animated: true)
                    })
                    alert.addAction(actionOk)
                    self!.present(alert, animated: true, completion: nil)
 
                } else{
                    let alert = UIAlertController(title: "Passwords do not match", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                    let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(actionOk)
                    self!.present(alert, animated: true, completion: nil)
                }

            } else {
                let alert = UIAlertController(title: "Invalid Credentials", message: "Please Try Again", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self!.present(alert, animated: true, completion: nil)
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

}
