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
        
        self.lbltest.text = "Hi \(UserSingleton.activeRider.fullName) Good \(timeOfDay)"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogout(_ sender: UIBarButtonItem) {
        try! Auth.auth().signOut()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        self.present(loginVC, animated: false, completion: nil)
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
