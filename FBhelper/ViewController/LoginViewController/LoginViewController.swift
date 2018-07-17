//
//  LoginViewController.swift
//  FBhelper
//
//  Created by Taco on 2018/7/9.
//  Copyright © 2018年 Taco. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import NVActivityIndicatorView

class LoginViewController: UIViewController,NVActivityIndicatorViewable {

    @IBOutlet weak var loginButton: UIButton!
    
    
    
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        
        
        
        FBSDKLoginManager().logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: self) { (result, error) in
            
            
            if error != nil{
                
                print("longinerror =\(String(describing: error))")
                
                return
            }
            
            if error != nil {
                //self.stopAnimating()
                //[self.tipsLbl setText:@"Facebook登入失敗"];
            } else if (result?.isCancelled)! {
               // self.stopAnimating()
                //[self.tipsLbl setText:@"取消Facebook登入"];
            } else {
                
               //self.stopAnimating()
                
                let liveVc = LiveViewController()

                self.navigationController?.pushViewController(liveVc, animated: true)
            }
            
            
            
        }
    }
    
    func fetchProfile(){
        print("attempt to fetch profile......")
        
        let parameters = ["fields": "email"]
        
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {
            connection, result, error -> Void in
            
            
            if error != nil {
                print("登入失敗")
                print("longinerror =\(String(describing: error))")
            } else {
                
                if let resultNew = result as? [String:Any]{
                    
                    print("成功登入")
                    
                    let email = resultNew["email"]  as! String
                    print(email)
                
                    
                    let uid = resultNew["id"]  as! String
                    
                    print(uid)

                    
                    let token  = FBSDKAccessToken.current().tokenString
                    
                    print(token ?? "無")
                    
                    
                    
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true;

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
