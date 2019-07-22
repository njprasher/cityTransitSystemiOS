//
//  AddNewRoutesViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-22.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase
class AddNewRoutesViewController: UIViewController {

    @IBOutlet weak var txtRouteId: UITextField!
    @IBOutlet weak var txtRouteName: UITextField!
    @IBOutlet weak var txtRouteFrequency: UITextField!
    @IBOutlet weak var segmentColor: UISegmentedControl!
    @IBOutlet weak var segmentPrice: UISegmentedControl!
    @IBOutlet weak var txtRouteStart: UITextField!
    @IBOutlet weak var txtRouteEnd: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Do you want to save this?", message: "", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "Save", style: .default, handler: {(actionOK) in
            self.ref = Database.database().reference()
            
            let user = Auth.auth().currentUser
            //checking if user exist for security
            if let user = user {
                self.ref.child("routes").child(user.uid)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeId").setValue(Int(self.txtRouteId.text ?? "0"))
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeName").setValue(self.txtRouteName.text)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeFrequency").setValue(Int(self.txtRouteFrequency.text ?? "0"))
                var color = String()
                switch self.segmentColor.selectedSegmentIndex {
                case 0:
                    color = "red"
                case 1:
                    color = "blue"
                case 2:
                    color = "green"
                case 3:
                    color = "yellow"
                case 4:
                    color = "orange"
                default:
                    color = "white"
                }
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeColor").setValue(color)
               
                var price = Float()
                switch self.segmentPrice.selectedSegmentIndex {
                case 0:
                    price = 2.5
                case 1:
                    price = 2.75
                case 2:
                    price = 3.1
                case 3:
                    price = 4.4
                case 4:
                    price = 8.4
                default:
                    price = 0.0
                }
                self.ref.child("routes").child(self.txtRouteId.text!).child("routePrice").setValue(price)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeStart").setValue(self.txtRouteStart.text)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeEnd").setValue(self.txtRouteEnd.text)
                
            }
            
            self.performSegue(withIdentifier: "comeToAdminRoutes", sender: self)
        })
        
        alert.addAction(actionOK)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {(actionCancel) in
            print("cancel")
        })
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "comeToAdminRoutes", sender: self)
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
