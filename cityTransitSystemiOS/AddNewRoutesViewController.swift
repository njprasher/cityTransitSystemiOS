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
    @IBOutlet weak var txtRoutePrice: UITextField!
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
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeId").setValue(self.txtRouteId.text)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeName").setValue(self.txtRouteName.text)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeFrequency").setValue(self.txtRouteFrequency.text)
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
                self.ref.child("routes").child(self.txtRouteId.text!).child("routePrice").setValue(self.txtRoutePrice.text)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeStart").setValue(self.txtRouteStart.text)
                self.ref.child("routes").child(self.txtRouteId.text!).child("routeEnd").setValue(self.txtRouteEnd.text)
                
            }
        })
        
        alert.addAction(actionOK)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {(actionCancel) in
            print("cancel")
        })
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
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
