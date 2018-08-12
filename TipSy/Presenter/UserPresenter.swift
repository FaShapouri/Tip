//
//  UserPresenter.swift
//  TipSy
//
//  Created by Fatemeh on 8/12/18.
//  Copyright © 2018 Fa. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore
import FBSDKShareKit

protocol UserViewHandler: NSObjectProtocol {
    func startLoading()
    func cancelLoading()
    func finishLoading(user: User)
    func failedLoading(message: String)
}

class UserPresenter {
    weak fileprivate var userView : UserViewHandler?
    
    init(){
    }
    
    func attachView(_ view : UserViewHandler){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func signInUserByTipsy(){
    }
    
    func signUpUserByTipsy() {
        
    }
    
    func signInUserByFacebook(vc: UIViewController) {
        
        userView?.startLoading()
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile,.email], viewController: vc) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
                self.userView?.failedLoading(message: error.localizedDescription)
            case .cancelled:
                print("User cancelled login.")
                self.userView?.cancelLoading()
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                //go to next vc
                self.getUserInfoByFacebook(accessToken)
                print("Logged in!")
            }
        }
    }
    
    func getUserInfoByFacebook(_ accessToken: AccessToken) {
        
        let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: accessToken.authenticationToken, version: nil, httpMethod: "GET")
        req?.start(completionHandler: { (connection, result, error) in
            if(error == nil)
            {
                if let data = result as? [String:Any] {
                    let user = User(name: data["name"] as! String, email: data["email"] as! String, id: data["id"] as! String)
                    self.userView?.finishLoading(user: user)
                }
                else {
                    self.userView?.failedLoading(message: "unknown")
                }
            }
            else
            {
                self.userView?.failedLoading(message: (error?.localizedDescription)!)
            }
        })
    }
}
