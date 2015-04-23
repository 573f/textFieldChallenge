//
//  zipCodeTextFieldDelegate.swift
//  textFieldChallange
//
//  Created by Stephen Skubik-Peplaski on 4/22/15.
//  Copyright (c) 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Foundation
import UIKit

class zipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if (range.length == 1 && count(string) == 0) {
            return true
        }
        
        let properLength = count(textField.text) < 5;
        let itsOnlyDigits = string.rangeOfCharacterFromSet(NSCharacterSet(charactersInString: "1234567890").invertedSet) == nil
        
        return properLength && itsOnlyDigits
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }

}
