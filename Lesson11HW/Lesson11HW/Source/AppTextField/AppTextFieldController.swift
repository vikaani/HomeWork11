//
//  TextFieldController.swift
//  Lesson11HW
//
//  Created by Vika on 01.04.2024.
//

import UIKit

class AppTextFieldController: NSObject {
    @IBOutlet var textField: AppTextField!
    
    private var maxTextFieldCharactersCount = 30
    
    func setup() {
        textField.textField.delegate = self
    }
    
    func setTextFieldAsFirstResponder() {
        textField.textField.becomeFirstResponder()
    }
    
    private func updateCounterLabel(counter: Int) {
        textField.counterLabel.text = "\(counter)"
        textField.counterLabel.textColor = counter > 0 ? .systemGreen : .systemRed
    }
}

// MARK: UITextFieldDelegate
extension AppTextFieldController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
        
        let canUpdateTextFieldText = updatedText.count <= maxTextFieldCharactersCount
        
        if canUpdateTextFieldText {
            let remainCharactersCount = abs(maxTextFieldCharactersCount - updatedText.count)
            
            updateCounterLabel(counter: remainCharactersCount)
        }
        
        return canUpdateTextFieldText
    }
}
