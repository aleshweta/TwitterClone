//
//  LoginViewController.swift
//  Twitter
//
//  Created by Shweta Ale on 9/23/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
         //once page shows what to appear
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl,//what url to call and
                                       success: {
                                        //don't ask user to login again and again
                                        UserDefaults.standard.set(true, forKey:"userLoggedIn" ) //name of the value
            self.performSegue(withIdentifier: "LoginToHome", // what to call when sucees
                              sender: self)
                                       }, failure: {(Error) in
                                        print("Couldn't login!")
                                        }) //and waht to call when failure
       
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
