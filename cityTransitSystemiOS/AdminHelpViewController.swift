//
//  AdminHelpViewController.swift
//  cityTransitSystemiOS
//
//  Created by Neeraj Prasher on 2019-07-23.
//  Copyright © 2019 njprasher. All rights reserved.
//

import UIKit
import MessageUI

class AdminHelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnContactUs(_ sender: UIButton) {
        let alert = UIAlertController(title: "Contact Us",
                                      message: "If you need help our email is \n help@routes.com \n +12892330609",
                                      preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Cancel",
                                     style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        let callAction = UIAlertAction(title: "Call Us",
                                       style: .default, handler: {
                                        _ in
                                        self.makeCall()
        })
        alert.addAction(callAction)
        
        let smsAction = UIAlertAction(title: "Message Us",
                                      style: .default, handler: {
                                        _ in
                                        self.sendSMS()
        })
        alert.addAction(smsAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func makeCall()
    {
        if let url = URL(string: "tel://+12892330609)"), UIApplication.shared.canOpenURL(url){
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    private func sendSMS()
    {
        if MFMessageComposeViewController.canSendText()
        {
            let messageVC = MFMessageComposeViewController()
            
            messageVC.body = "Hello, How are you?"
            messageVC.recipients = ["+12892330609"]
            messageVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            
            self.present(messageVC, animated: false, completion: nil)
        }
        else
        {
            print("NO SIM available")
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
