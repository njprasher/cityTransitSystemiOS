//
//  AboutUsViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-20.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import WebKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var wkAboutUs: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadFromURL()
        // Do any additional setup after loading the view.
    }
    
    func loadFromURL(){
        let url = URL(string: "https://www.ttc.ca/Routes/General_Information/General_Information.jsp")
        let urlReq = URLRequest(url: url!)
        wkAboutUs.load(urlReq)
    }
    @IBAction func webBrowserAction(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            wkAboutUs.reloadFromOrigin()
        case 1:
            if wkAboutUs.canGoForward{
                wkAboutUs.goForward()
            }
        case 2:
            if wkAboutUs.canGoBack{
                wkAboutUs.goBack()
            }
        case 3:
            wkAboutUs.reload()
        default:
            print("Nothing to do")
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

}
