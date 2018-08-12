//
//  MainViewController.swift
//  TipSy
//
//  Created by Fatemeh on 8/12/18.
//  Copyright © 2018 Fa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var infolbl: UILabel!
    var user : User!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        infolbl.text = user.name
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
