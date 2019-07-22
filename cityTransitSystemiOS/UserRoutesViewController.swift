//
//  UserRoutesViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-17.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class UserRoutesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblAllRoutes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblAllRoutes.delegate = self
        self.tblAllRoutes.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routesCell")  as! UITableViewCell
        cell.textLabel?.text = "hi"
        return cell
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
