//
//  TabViewController.swift
//  Final_Exam
//
//  Created by APPLE on 03/03/23.
//

import UIKit
import FirebaseAuth

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutPressed(_ sender: UIButton) {

            let controllers = self.navigationController?.viewControllers
                    for vc in controllers! {
                        if vc is LoginViewController {
                            _ = self.navigationController?.popToViewController(vc as! LoginViewController, animated: true)
                        }
                    }

            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            UserDefaults.standard.removeObject(forKey: "email")
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }

        }

}
