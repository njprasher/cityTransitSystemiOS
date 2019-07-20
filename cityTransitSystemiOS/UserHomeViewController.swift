//
//  UserHomeViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class UserHomeViewController: UIViewController {
    @IBOutlet weak var lbltest: UILabel!
    
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtDateOfBirth: UITextField!
    
    @IBOutlet weak var txtContact: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    // reference to the firebase database
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var timeOfDay: String{
            let date = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            if hour >= 5 && hour < 12{
                return "Morning"
            } else{
                if hour >= 12 && hour < 17{
                    return "Afternoon"
                }else{
                        return "Evening"
                    }
                }
            }
        
        // retrieving data from firebase
        
        //getting current active user
        let userID = Auth.auth().currentUser?.uid
        ref.child("riders").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let firstName = value?["firstName"] as? String ?? ""
            let lastName = value?["lastName"] as? String ?? ""
            let dateOfBirth = value?["dateOfBirth"] as? String ?? ""
            let contact = value?["contact"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            
            self.lbltest.text = "Hi \(firstName), Good \(timeOfDay)"
            self.txtFirstName.text = firstName
            self.txtLastName.text = lastName
            self.txtDateOfBirth.text = dateOfBirth
            self.txtContact.text = contact
            self.txtEmail.text = email
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Do you want to Log Out", message: "", preferredStyle: UIAlertController.Style.actionSheet)

        let actionLogOut = UIAlertAction(title: "Logout", style: UIAlertAction.Style.default, handler: { (actionLogOut) in
            
            //first signing out from firebase then moving to Routes Home Screen
            
            try! Auth.auth().signOut()
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            let navigationVC = sb.instantiateViewController(withIdentifier: "NavigationVC")
            
            self.present(navigationVC, animated: true, completion: nil)
        })
        alert.addAction(actionLogOut)
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
       
        }
    
    //made profile editable
    
    @IBAction func btnEditFirstName(_ sender: UIButton) {
        if !self.txtFirstName.isUserInteractionEnabled{
            sender.setTitle("Save", for: .normal)
            self.txtFirstName.isUserInteractionEnabled = true
            
        } else{
            sender.setTitle("✎ Edit", for: .normal)
            let user = Auth.auth().currentUser
            if let user = user {
                self.ref.child("riders").child(user.uid)
                self.ref.child("riders").child(user.uid).child("firstName").setValue(self.txtFirstName.text)
            }
            self.txtFirstName.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func btnEditLastName(_ sender: UIButton) {
        if !self.txtLastName.isUserInteractionEnabled{
            sender.setTitle("Save", for: .normal)
            self.txtLastName.isUserInteractionEnabled = true
            
        } else{
            sender.setTitle("✎ Edit", for: .normal)
            let user = Auth.auth().currentUser
            if let user = user {
                self.ref.child("riders").child(user.uid)
                self.ref.child("riders").child(user.uid).child("lastName").setValue(self.txtLastName.text)
            }
            self.txtLastName.isUserInteractionEnabled = false
        }
    }
    @IBAction func btnEditDateOfBirth(_ sender: UIButton) {
        if !self.txtDateOfBirth.isUserInteractionEnabled{
            sender.setTitle("Save", for: .normal)
            self.txtDateOfBirth.isUserInteractionEnabled = true
            
        } else{
            sender.setTitle("✎ Edit", for: .normal)
            let user = Auth.auth().currentUser
            if let user = user {
                self.ref.child("riders").child(user.uid)
                 self.ref.child("riders").child(user.uid).child("dateOfBirth").setValue(self.txtDateOfBirth.text)

            }
            self.txtDateOfBirth.isUserInteractionEnabled = false
        }
    }
    @IBAction func btnEditContact(_ sender: UIButton) {
        if !self.txtContact.isUserInteractionEnabled{
            sender.setTitle("Save", for: .normal)
            self.txtContact.isUserInteractionEnabled = true
            
        } else{
            sender.setTitle("✎ Edit", for: .normal)
            let user = Auth.auth().currentUser
            if let user = user {
                self.ref.child("riders").child(user.uid)
                 self.ref.child("riders").child(user.uid).child("contact").setValue(self.txtContact.text)

            }
            self.txtContact.isUserInteractionEnabled = false
        }
    }
    @IBAction func btnEditEmail(_ sender: UIButton) {
        if !self.txtEmail.isUserInteractionEnabled{
            sender.setTitle("Save", for: .normal)
            self.txtEmail.isUserInteractionEnabled = true
            
        } else{
            sender.setTitle("✎ Edit", for: .normal)
            Auth.auth().currentUser?.updateEmail(to: self.txtEmail.text!) { (error) in
                // ...
                let user = Auth.auth().currentUser
                if let user = user {
                    self.ref.child("riders").child(user.uid)
                    self.ref.child("riders").child(user.uid).child("email").setValue(user.email)
                }
            }
            
            self.txtEmail.isUserInteractionEnabled = false
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
