//
//  RoutesViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-06-30.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import Firebase

class RoutesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // reference to the firebase database
    var db: DatabaseReference!
    
    @IBOutlet weak var tblRoutes: UITableView!
    
    var routeName = "McLaughlin"
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        let r1 = Routes(routeName: "mAVIS", routeId: "66", routeStart: "Brampton South", routeEnd: "Mississauga City Center", routePrice: 3.10, routeFrequency: 25, routeColor: RouteColor.Orange)
        let r2 = Routes(routeName: "MVIS", routeId: "66", routeStart: "Brampton South", routeEnd: "Mississauga City Center", routePrice: 3.10, routeFrequency: 25, routeColor: RouteColor.Orange)
        let r3 = Routes(routeName: "MVS", routeId: "66", routeStart: "Brampton South", routeEnd: "Mississauga City Center", routePrice: 3.10, routeFrequency: 25, routeColor: RouteColor.Orange)
        let r4 = Routes(routeName: "McLaughlin", routeId: "78", routeStart: "idk", routeEnd: "idk", routePrice: 3.75, routeFrequency: 45, routeColor: RouteColor.Green)
        
        
        Routes.routesArray = [r1, r2, r3, r4]
        
        //to make tables active
        self.tblRoutes.delegate = self
        self.tblRoutes.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Routes.routesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routeCell")  as! UITableViewCell
        
        cell.textLabel?.text = Routes.routesArray[indexPath.row].routeName
        cell.tag = indexPath.row
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
