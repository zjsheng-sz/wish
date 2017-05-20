//
//  GWHomePageController.swift
//  wish
//
//  Created by autel on 17/5/19.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

import UIKit

class GWHomePageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let view = GWView.init(color: UIColor.white, name: "hahha")
        print(view.name)
        
        
        let myView = GWView.init()
        
        print(myView.name)
        
        
        let validateEmail = "770649662@qq.com"
        
        emptyString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}


struct GWView {
    
    var color: UIColor = UIColor.red
    var name : String = "zjs"
    
}
