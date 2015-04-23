//
//  cashTextFieldDelegate.swift
//  textFieldChallange
//
//  Created by Stephen Skubik-Peplaski on 4/22/15.
//  Copyright (c) 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Foundation
import UIKit

class cashTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // handle backspace
        if (range.length == 1 && count(string) == 0) {
            textField.text = formatCurrency(textField.text.stringByPaddingToLength(count(textField.text) - 1 , withString: "", startingAtIndex: 0))
        } else {
            textField.text = formatCurrency(textField.text + string)
        }
 
        return false
    }
    
    func formatCurrency(numberString: String) -> String {
        // define valid characters
        let digits = NSCharacterSet(charactersInString: "1234567890")

        // filter string to just digits
        let currencyString = String(Array(numberString).filter({ String($0).rangeOfCharacterFromSet(digits) != nil}))
        
        // setup the formatter
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        let money = NSString(string:currencyString).doubleValue / 100
        
        return formatter.stringFromNumber(money)!
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
}