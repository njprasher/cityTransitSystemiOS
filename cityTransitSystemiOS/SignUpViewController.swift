//
//  SignUpViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtDateOfBirth: UITextField!
    
    @IBOutlet weak var txtContact: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPasswordAgain: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.maximumDate = Date()
        let calendar = Calendar(identifier: .gregorian)
        let currentDate = Date()
        var components = DateComponents()
        components.year = -150
        datePicker?.minimumDate = calendar.date(byAdding: components, to: currentDate)!
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SignUpViewController.dateChanged(datePicker:)), for: .valueChanged)

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        txtDateOfBirth.inputView = datePicker
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        txtDateOfBirth.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
    @IBAction func endFirstName(_ sender: Any) {
        if(txtFirstName.text == ""){
            let alert = UIAlertController(title: "Please enter a First Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(!(txtFirstName.text?.isValidName())!){
                let alert = UIAlertController(title: "Please enter correct First Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func endLastName(_ sender: UITextField) {
        if(txtLastName.text == ""){
            let alert = UIAlertController(title: "Please enter a Last Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(!(txtLastName.text?.isValidName())!){
                let alert = UIAlertController(title: "Please enter correct Last Name", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    @IBAction func signUpCheck(_ sender: UIButton) {
        
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
