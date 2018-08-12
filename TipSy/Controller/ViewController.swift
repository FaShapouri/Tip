//
//  ViewController.swift
//  TipSy
//
//  Created by Fatemeh on 8/12/18.
//  Copyright © 2018 Fa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let userPresenter = UserPresenter()
    
    @IBOutlet weak var fbLoginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userPresenter.attachView(self)
        // Handle clicks on the button
        fbLoginButton.applyGradient(colors: [FSColor.GradientLight, FSColor.GradientDark], gradientOrientation: .topLeftBottomRight)
        fbLoginButton.layer.borderWidth = 1
        fbLoginButton.clipsToBounds = true
        fbLoginButton.layer.cornerRadius = Fixed.CornerRadius
        
//        if let accessToken = AccessToken.current {
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Once the button is clicked, show the login dialog
    @IBAction func loginButtonClicked() {
        userPresenter.signInUserByFacebook(vc: self)
    }
}

extension ViewController: UserViewHandler {
    
    func startLoading() {
        //show activity indicator
    }
    
    func finishLoading(user : User) {
        //stop activity indicator
        //save user
        //go to next page
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        controller.user = user
        self.present(controller, animated: true, completion: nil)
        
    }
    func cancelLoading() {
        // do any action to cancel
    }
    
    func failedLoading(message: String) {
        //show message
    }
}


