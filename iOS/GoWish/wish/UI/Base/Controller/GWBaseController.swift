//
//  GWBaseController.swift
//  wish
//
//  Created by autel on 17/6/2.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

import UIKit

class GWBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBaseInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func setupBaseInfo() {
        
        self.view.backgroundColor = GWBackgroundColor
        self.hidesBottomBarWhenPushed = true
        self.automaticallyAdjustsScrollViewInsets = false
        
        
    }

}
