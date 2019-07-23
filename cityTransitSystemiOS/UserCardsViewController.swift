//
//  UserCardsViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-17.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class UserCardsViewController: UIViewController {

    @IBOutlet weak var lblCardNumber: UILabel!
    @IBOutlet weak var lblCardBalance: UILabel!
    
    // reference to the firebase database
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // retrieving data from firebase
        
        //getting current active user
        let userID = Auth.auth().currentUser?.uid
        ref.child("riders").child(userID!).child("card").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let cardBalance = value?["cardBalance"]  as? NSNumber ?? NSNumber(40.4)
            let cardNumber = value?["cardNumber"] as? NSNumber ?? NSNumber(40.4)
            let cardBalanceFloat = Float(truncating: cardBalance)
            
            self.lblCardNumber.text = "\(cardNumber)"
            self.lblCardBalance.text = cardBalanceFloat.currency()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        // Do any additional setup after loading the view.

    }
    override func viewWillAppear(_ animated: Bool) {
        // retrieving data from firebase
        
        //getting current active user
        let userID = Auth.auth().currentUser?.uid
        ref.child("riders").child(userID!).child("card").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let cardBalance = value?["cardBalance"]  as? NSNumber ?? NSNumber(40.4)
            let cardNumber = value?["cardNumber"] as? NSNumber ?? NSNumber(40.4)
            let cardBalanceFloat = Float(truncating: cardBalance)
            
            self.lblCardNumber.text = "\(cardNumber)"
            self.lblCardBalance.text = cardBalanceFloat.currency()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        // retrieving data from firebase
        
        //getting current active user
        let userID = Auth.auth().currentUser?.uid
        ref.child("riders").child(userID!).child("card").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let cardBalance = value?["cardBalance"]  as? NSNumber ?? NSNumber(40.4)
            let cardNumber = value?["cardNumber"] as? NSNumber ?? NSNumber(40.4)
            let cardBalanceFloat = Float(truncating: cardBalance)
            
            self.lblCardNumber.text = "\(cardNumber)"
            self.lblCardBalance.text = cardBalanceFloat.currency()
            // ...
        }) { (error) in
            print(error.localizedDescription)
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
