//
//  ViewController.swift
//  VerificationCodeDemo
//
//  Created by Minewtech on 2018/10/22.
//  Copyright © 2018 Minewtech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var VerificationCode : VerificationCodeView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VerificationCode = VerificationCodeView()
        VerificationCode?.initCount(count: 6)
        VerificationCode?.frame = CGRect.init(x: 0, y: 200, width: self.view.frame.width, height: 300)
        self.view.addSubview(VerificationCode!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

