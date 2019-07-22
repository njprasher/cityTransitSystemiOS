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
    
    //https://firebase.google.com/docs/database/ios/read-and-write
    
    var ref:DatabaseReference!
    var tblIdArray = Array<String>()
    var routesDict = [String: Routes]()
    
    @IBOutlet weak var tblAllRoutes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        //getting database reference
        self.ref = Database.database().reference()
        //to make tables active -almost forgot this-
        self.tblAllRoutes.delegate = self
        self.tblAllRoutes.dataSource = self
        
        self.navigationItem.title = "Routes"
        
        self.ref.child("routes").observeSingleEvent(of: .value, with: {(snapshot) in
            for thisRoute in snapshot.children.allObjects as! [DataSnapshot] {
                print(thisRoute.key)
                //put values in array over here
                self.tblIdArray.append(thisRoute.key)
                //getting all values for particular id from firebase
                let value = thisRoute.value as? NSDictionary
                let routeName = value?["routeName"]  as? String ?? "not found"
                let routeColor = value?["routeColor"]  as? String ?? "not found"
                let routeId = value?["routeId"]  as? Int ?? Int(404)
                let routeStart = value?["routeStart"]  as? String ?? "not found"
                let routeEnd = value?["routeEnd"]  as? String ?? "not found"
                let routeFrequency = value?["routeFrequency"]  as? Int ?? Int(404)
                let routePrice = value?["routePrice"]  as? NSNumber ?? NSNumber(40.4)
                let r1 = Routes(routeName: routeName, routeId: String(routeId), routeStart: routeStart, routeEnd: routeEnd, routePrice: Float(truncating: routePrice), routeFrequency: routeFrequency, routeColor: RouteColor(rawValue: routeColor) ?? RouteColor.white)
                self.routesDict[thisRoute.key] =  r1
            }
            
            //this code runs at the end of everything
            print(self.tblIdArray , "<---- id array outside")
            self.tblAllRoutes.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("table cell number load")
        //getting number of current routes from the local array which is populated by firebase
        return self.tblIdArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routesCell")  as! UITableViewCell
        cell.textLabel?.text = "Route Id:  \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeId))  \nRoute Name: \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeName)) \nRoute Price: \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routePrice.currency())) \nRoute Frequency: \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeFrequency.minutes())) \nRoute Start: \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeStart)) \nRoute End: \(String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeEnd))"
        cell.tag = indexPath.row
        cell.textLabel?.numberOfLines = 8
        let color = String(describing: self.routesDict[self.tblIdArray[indexPath.row]]!.routeColor)
        switch color {
        case "orange":
            cell.backgroundColor = UIColor.orange
        case "red":
            cell.backgroundColor = UIColor.red
        case "green":
            cell.backgroundColor = UIColor.green
        case "yellow":
            cell.backgroundColor = UIColor.yellow
        case "blue":
            cell.backgroundColor = UIColor.blue
        default:
            cell.backgroundColor = UIColor.white
        }
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
