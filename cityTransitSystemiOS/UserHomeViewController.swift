//
//  UserHomeViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-01.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit

class UserHomeViewController: UIViewController {
    @IBOutlet weak var lbltest: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lbltest.text = UserSingleton.activeRider.fullName
        
        // Do any additional setup after loading the view.
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
