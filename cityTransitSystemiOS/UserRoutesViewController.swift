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
    
    //all routes available
    var routecount = 0
    
    @IBOutlet weak var tblAllRoutes: UITableView!
    
    // reference to the firebase database
    let ref = Database.database().reference()
    
    var routeName = String()
    var routeColor = String()
    var routeId = String()
    var routeStart = String()
    var routeEnd = String()
    var routeFrequency = String()
    var routePrice = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref.child("routes").observeSingleEvent(of: .value, with: {(snapshot) in
            for thisRoute in snapshot.children.allObjects as! [DataSnapshot] {
                
                self.ref.child("routes").child(thisRoute.key).observeSingleEvent(of: .value, with: {(snapshot) in
                    let value = snapshot.value as? NSDictionary
                    self.routeName = value?["routeName"]  as? String ?? ""
                    self.routeColor = value?["routeColor"]  as? String ?? ""
                    self.routeId = value?["routeId"]  as? String ?? ""
                    self.routeStart = value?["routeStart"]  as? String ?? ""
                    self.routeEnd = value?["routeEnd"]  as? String ?? ""
                    self.routeFrequency = value?["routeFrequency"]  as? String ?? ""
                    self.routePrice = value?["routePrice"]  as? String ?? ""
                })
                
                
            }
            
        })
        
        //to make tables active almost forgot this
        self.tblAllRoutes.delegate = self
        self.tblAllRoutes.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print("Starting observing");
        self.ref.child("routes").observe(.value, with: { (snapshot: DataSnapshot!) in
            print("Got snapshot");
            print(snapshot.childrenCount)
            self.routecount = Int(snapshot.childrenCount)
        })
        
        print("Returning count")
        print(routecount)
        return routecount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("reched here")
        let cell = tableView.dequeueReusableCell(withIdentifier: "routesCell") as! UITableViewCell
        
    
        cell.textLabel?.text = "hi there"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBtnAction(_:)))
        cell.tag = indexPath.row
        cell.addGestureRecognizer(tapGesture)
        return cell
    }
    
    
    @objc func tapBtnAction(_ sender: UITapGestureRecognizer) {
        //Customer.activeCustomer = self.customerArray[(sender.view?.tag)!]
        //self.performSegue(withIdentifier: "GoToDetailS", sender: self)
        print("going")
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
