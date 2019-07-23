//
//  UserLoadCardViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-23.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class UserLoadCardViewController: UIViewController {

    @IBOutlet weak var txtAmount: UITextField!
    
    // reference to the firebase database
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnLoadCard(_ sender: UIButton) {
        if let loadAmount = self.txtAmount.text {
            let alert = UIAlertController(title: "Do you want to add $ \(loadAmount)", message: "", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { (_) in
                let loadAmountFloat = Float(loadAmount)
                var cardBalanceFloat = Float()
                //getting current active user
                let userID = Auth.auth().currentUser?.uid
        self.ref.child("riders").child(userID!).child("card").observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value = snapshot.value as? NSDictionary
                    let cardBalance = value?["cardBalance"]  as? NSNumber ?? NSNumber(40.4)
                    cardBalanceFloat = Float(truncating: cardBalance)
                    let newAmount = loadAmountFloat! + cardBalanceFloat
                    print(newAmount , "<---- new amount")
                    print(cardBalanceFloat , "<---- card balance")
                    print(loadAmountFloat , "<---- amount to be loaded")
                    self.ref.child("riders").child(userID!).child("card").child("cardBalance").setValue(newAmount)
                    // ...
                }) { (error) in
                    print(error.localizedDescription)
                }
                self.navigationController?.popViewController(animated: true) })
            alert.addAction(OKAction)
            let CancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
            alert.addAction(CancelAction)
            self.present(alert, animated: true, completion: nil)
        } else{
            let alert = UIAlertController(title: "Please Enter Some Amount to Load", message: "Try Again", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
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
