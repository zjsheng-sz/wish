//
//  GWLoginController.swift
//  wish
//
//  Created by autel on 17/6/2.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

import UIKit


class GWLoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let name = "zjs"
        
        let isValidateEmail = name.isValidateEmail
        
        print(isValidateEmail);
        
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
