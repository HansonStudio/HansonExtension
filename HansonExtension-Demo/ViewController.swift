//
//  ViewController.swift
//  HansonExtension-Demo
//
//  Created by Hanson on 2017/11/2.
//  Copyright © 2017年 HansonStudio. All rights reserved.
//

import UIKit
import HansonExtensionKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _ = UIApplication.hs.presentedViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

