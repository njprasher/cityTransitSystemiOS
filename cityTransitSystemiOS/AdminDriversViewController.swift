//
//  AdminDriversViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-10.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class AdminDriversViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogOut(_ sender: UIBarButtonItem) {
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
