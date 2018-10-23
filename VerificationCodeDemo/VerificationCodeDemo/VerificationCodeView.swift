//
//  VerificationCodeView.swift
//  VerificationCodeDemo
//
//  Created by Minewtech on 2018/10/22.
//  Copyright © 2018 Minewtech. All rights reserved.
//

import UIKit

class VerificationCodeView: UIView {

    let margin = 10
    var counts : Int?
    
    func initCount(count:Int) -> Void {
        
        counts = count
        let textField = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: 414, height: 300))
        textField.tag = 200
        textField.backgroundColor = UIColor.clear
        textField.addTarget(self, action: #selector(something(textF:)), for:UIControl.Event.editingChanged)
        self.addSubview(textField)
        
        let maskBtn = UIButton.init(type: UIButton.ButtonType.custom)
        maskBtn.backgroundColor = UIColor.white
        maskBtn.frame = CGRect.init(x: 0, y: 0, width: 414, height: 300)
        maskBtn.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
        self.addSubview(maskBtn)
        
        for key in 0..<count {
            
            let numberLabel = UILabel()
            numberLabel.backgroundColor = UIColor.blue
            numberLabel.tag = 100 + key
            numberLabel.frame = CGRect.init(x: 0+margin*key+50*key, y: 125, width: 50, height: 50)
            self.addSubview(numberLabel)
            
        }
        
    }
    
    @objc func click() -> Void {
        let textF = self.viewWithTag(200) as! UITextField
        textF.becomeFirstResponder()
    }
    
    @objc func something(textF:UITextField) -> Void {
        
        let textFLength = textF.text?.lengthOfBytes(using: String.Encoding.utf8)
        
        if (textFLength)! > counts! {
            textF.text = String.init((textF.text?.prefix(counts!))!)
            return
        }
        
        for key in 0..<counts! {
            let label : UILabel = self.viewWithTag(100+key) as! UILabel
            if key < textFLength! {
                let index = textF.text?.index((textF.text?.startIndex)!, offsetBy: key)
                let nextindex = textF.text?.index((textF.text?.startIndex)!, offsetBy: 1+key)
                
                label.text = String(textF.text![(index)!..<(nextindex)!])
            }
            else
            {
                label.text = nil
            }
        }
    }

}
