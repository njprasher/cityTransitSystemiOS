//
//  SignUpViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtDateOfBirth: UITextField!
    
    @IBOutlet weak var txtContact: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtPasswordAgain: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var imgViewBG: UIImageView!
    
    // reference to the firebase database
    let ref = Database.database().reference()
    
    // to handle firebase exceptions
    
    var handle: AuthStateDidChangeListenerHandle?
    
    // var to store check validation
    
    var firstNameValid = false
    var lastNameValid = false
    var dateOfBirthValid = false
    var contactValid = false
    var emailValid = false
    var passwordValid = false
    var passwordAgainValid = false
    
    //convert String to Date
    func stringToDate(string: String) -> Date{
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "MM/dd/YYYY"
        
        let dateInFormat = dateformatter.date(from: string)
        
        return dateInFormat!
    }
    
    //convert Date to String
    func dateToString(date: Date) -> String{
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "MM/dd/YYYY"
        
        let stringInFormat = dateformatter.string(from: date)
        
        return stringInFormat
    }
    
    
    private var datePicker: UIDatePicker?
    
    //variable to store current date
    
    var datePrevious = ""
    
    //func to add done and cancel UIToolbar to the UIDatePicker
    
    func ToolbarPicker (myCancel : Selector, myDone: Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: myCancel)
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: myDone)
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //show gif file
        imgViewBG.loadGif(name: "snowman")
        
        //creating datePicker
        
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
        
        //added toolbar with done and cancel button
        
        let toolBar = ToolbarPicker(myCancel: #selector(self.dismissByCancel), myDone: #selector(self.dismissByDone))
        
        txtDateOfBirth.inputAccessoryView = toolBar

        txtDateOfBirth.inputView = datePicker
        // Do any additional setup after loading the view.
    }
    
    //func to check if tapped on view
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    //func to check if date changed
    
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        txtDateOfBirth.text = dateFormatter.string(from: datePicker.date)
    }
    
    //func to dismiss picker when done or cancel pressed
    
    @objc func dismissByCancel() {
        txtDateOfBirth.text = self.datePrevious
        view.endEditing(true)
    }
    
    @objc func dismissByDone() {
        self.datePrevious = txtDateOfBirth.text ?? "\(self.dateToString(date: Date()))"
        view.endEditing(true)
    }
    
    //func to check valid First Name in input
    
    func checkFirstName(){
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
            } else {
                firstNameValid = true
            }
        }
    }
    
    //func to check valid Last Name in input
    
    func checkLastName(){
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
            } else {
                lastNameValid = true
            }
        }
    }
    
    //func to check valid Date of birth in input
    
    func checkDateOfBirth(){
        if(txtDateOfBirth.text == ""){
            let alert = UIAlertController(title: "Please enter Date of Birth", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(!(txtDateOfBirth.text?.isValidDate())!){
                let alert = UIAlertController(title: "Please enter correct Date of birth", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else {
                dateOfBirthValid = true
            }
        }
    }
    
    //func to check valid Contact in Input
    
    func checkContact(){
        if(txtContact.text == ""){
            let alert = UIAlertController(title: "Please enter Contact", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(!(txtContact.text?.isValidContact())!){
                let alert = UIAlertController(title: "Please enter correct Contact", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else {
                contactValid = true
            }
        }
    }
    
    //func to check valid email in input
    
    func checkEmail(){
        if(txtEmail.text == ""){
            let alert = UIAlertController(title: "Please enter Email", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(!(txtEmail.text?.isValidEmail())!){
                let alert = UIAlertController(title: "Please enter correct Email", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else {
                emailValid = true
            }
        }
    }
    
    //func to check valid password in input
    
    func checkPassword(){
        if(txtPassword.text == ""){
            let alert = UIAlertController(title: "Please enter Password", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(!(txtPassword.text?.isValidPassword())!){
                let alert = UIAlertController(title: "Password should be 8 character long with uppercase, lower case, number and a special character", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else {
                passwordValid = true
            }
        }
    }
    
    //func to check password matches in input
    
    func checkPasswordAgain(){
        if(txtPasswordAgain.text == ""){
            let alert = UIAlertController(title: "Please enter Password Again", message: "", preferredStyle: UIAlertController.Style.actionSheet)
            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(actionOk)
            self.present(alert, animated: true, completion: nil)
        } else{
            if(txtPassword.text != txtPasswordAgain.text){
                let alert = UIAlertController(title: "Password does not match", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                self.present(alert, animated: true, completion: nil)
            } else {
                passwordAgainValid = true
            }
        }
    }
    
    //check all
    
    func checkAll(){
        self.checkFirstName()
        self.checkLastName()
        self.checkDateOfBirth()
        self.checkContact()
        self.checkEmail()
        self.checkPassword()
        self.checkPasswordAgain()
    }
    
    //implementing checks
    
    @IBAction func endFirstName(_ sender: Any) {
        self.checkFirstName()
    }
    
    @IBAction func endLastName(_ sender: UITextField) {
      self.checkLastName()
    }
    
    @IBAction func endDateOfBirth(_ sender: UITextField) {
       self.checkDateOfBirth()
    }
    
    @IBAction func endContact(_ sender: UITextField) {
       self.checkContact()
    }
    
    @IBAction func endEmail(_ sender: UITextField) {
       self.checkEmail()
    }
    
    @IBAction func endPassword(_ sender: UITextField) {
        self.checkPassword()
    }
    
    @IBAction func endPasswordAgain(_ sender: UITextField) {
        self.checkPasswordAgain()
    }
    
    
    @IBAction func signUpCheck(_ sender: UIButton) {
        
        //checking everything is right before signing in
        
        self.checkAll()
        
        if (firstNameValid && lastNameValid && dateOfBirthValid && contactValid && emailValid && passwordValid && passwordAgainValid){
            
            print(firstNameValid)
            print(lastNameValid)
            print(dateOfBirthValid)
            print(contactValid)
            print(emailValid)
            print(passwordValid)
            print(passwordAgainValid)
        //changed email to lower case to make email consistent
        
        let lowerCasedEmail = txtEmail.text!.lowercased()
        
        Auth.auth().createUser(withEmail: lowerCasedEmail, password: self.txtPasswordAgain.text!) { authResult, error in
            if error == nil{
                let alert = UIAlertController(title: "Hi, \(String(describing: self.txtFirstName.text!)) you are successfully signed up", message: "", preferredStyle: UIAlertController.Style.actionSheet)
                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(actionOk)
                let actionLogin = UIAlertAction(title: "Login", style: UIAlertAction.Style.default, handler: { (actionLogin) in
                    //perform segue pushes another vc and thus the user can go back to the previous screen
                    self.performSegue(withIdentifier: "LoginViaAction", sender: nil)
                })
                alert.addAction(actionLogin)
                self.present(alert, animated: true, completion: nil)
            } else
            {
                self.handleError(error!)   // use the handleError method
            }
           
            //after creating user add all data to the firebase database
            let user = Auth.auth().currentUser
            if let user = user {
                self.ref.child("riders").child(user.uid)
                self.ref.child("riders").child(user.uid).child("firstName").setValue(self.txtFirstName.text)
                self.ref.child("riders").child(user.uid).child("lastName").setValue(self.txtLastName.text)
                self.ref.child("riders").child(user.uid).child("dateOfBirth").setValue(self.txtDateOfBirth.text)
                self.ref.child("riders").child(user.uid).child("contact").setValue(self.txtContact.text)
                self.ref.child("riders").child(user.uid).child("email").setValue(user.email)
            }
        }
    }
//        if UserSingleton.riderMailExist(mail: lowerCasedEmail) {
//            let alert = UIAlertController(title: "\(txtEmail.text!) already in use", message: "Try a different one", preferredStyle: UIAlertController.Style.actionSheet)
//            let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//            alert.addAction(actionOk)
//            self.present(alert, animated: true, completion: nil)
//        } else{
//            if UserSingleton.riderContactExist(contact: txtContact.text!){
//                let alert = UIAlertController(title: "\(txtContact.text!) already in use", message: "Try a different one", preferredStyle: UIAlertController.Style.actionSheet)
//                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//                alert.addAction(actionOk)
//                self.present(alert, animated: true, completion: nil)
//            } else{
//                let rider = Riders(password: txtPasswordAgain.text ?? "", firstName: txtFirstName.text!, lastName: txtLastName.text!, dateOfBirth: txtDateOfBirth.text!,email: lowerCasedEmail, contact: txtContact.text!)
//
//                UserSingleton.signUpRider(rider: rider)
//
//                let alert = UIAlertController(title: "Hi, \(rider.fullName), you are successfully signed up", message: "", preferredStyle: UIAlertController.Style.actionSheet)
//                let actionOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
//                alert.addAction(actionOk)
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
    }
}

 // ... creating new user with email and password and can handle errors over here

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account"
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again"
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email"
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password is incorrect. Please try again or use 'Forgot password' to reset your password"
        default:
            return "Unknown error occurred"
        }
    }
}


extension UIViewController{
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
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
