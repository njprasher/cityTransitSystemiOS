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
    
    //https://firebase.google.com/docs/database/ios/read-and-write
    
    var ref:DatabaseReference!
    var tblIdArray = Array<String>()
    var routesDict = [String: Routes]()
    
    @IBOutlet weak var tblRoutes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getting database reference
        self.ref = Database.database().reference()
        //to make tables active -almost forgot this-
        self.tblRoutes.delegate = self
        self.tblRoutes.dataSource = self
        
        print("view load")
        
        self.ref.child("routes").observeSingleEvent(of: .value, with: {(snapshot) in
            for thisRoute in snapshot.children.allObjects as! [DataSnapshot] {
                print(thisRoute.key)
                //put values in array over here
                self.tblIdArray.append(thisRoute.key)
                //getting all values for particular id from firebase
                let value = thisRoute.value as? NSDictionary
                let routeName = value?["routeName"]  as? String ?? "not found"
                let routeColor = value?["routeColor"]  as? String ?? "not found"
                let routeId = value?["routeId"]  as? String ?? "not found"
                let routeStart = value?["routeStart"]  as? String ?? "not found"
                let routeEnd = value?["routeEnd"]  as? String ?? "not found"
                let routeFrequency = value?["routeFrequency"]  as? String ?? "not found"
                let routePrice = value?["routePrice"]  as? String ?? "not found"
                let r1 = Routes(routeName: routeName, routeId: routeId, routeStart: routeStart, routeEnd: routeEnd, routePrice: Float(routePrice) ?? Float(0.0), routeFrequency: Int(routeFrequency) ?? Int(0), routeColor: RouteColor(rawValue: routeColor) ?? RouteColor.white)
                self.routesDict[thisRoute.key] =  r1
            }
            
            //this code runs at the end of everything
            print(self.tblIdArray , "<---- id array outside")
            self.tblRoutes.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("table cell number load")
        //getting number of current routes from the local array which is populated by firebase
        return self.tblIdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routesCell")  as! UITableViewCell
        cell.textLabel?.text = "\(self.tblIdArray[indexPath.row]) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeName)) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routePrice)) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeId)) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeColor)) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeFrequency)) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeStart)) \n \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeEnd))"
        cell.tag = indexPath.row
        cell.textLabel?.numberOfLines = 12
        print(" table cells load")
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
