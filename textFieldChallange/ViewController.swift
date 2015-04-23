//
//  ViewController.swift
//  textFieldChallange
//
//  Created by Stephen Skubik-Peplaski on 4/21/15.
//  Copyright (c) 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockSwitch: UISwitch!
    
    let zipCodeDelegate = zipCodeTextFieldDelegate()
    let cashDelegate = cashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.zipCodeTextField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashDelegate
        self.lockableTextField.delegate = self
    }
    
    @IBAction func switchDidChange () {
        if (!self.lockSwitch.on && self.lockableTextField.isFirstResponder()) {
            self.lockableTextField.resignFirstResponder()
        }
    }
    
    // TextFieldDelegate Methods
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.lockSwitch.on
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return self.lockSwitch.on
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

