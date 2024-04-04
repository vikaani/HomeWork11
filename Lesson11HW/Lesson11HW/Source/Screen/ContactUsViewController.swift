//
//  ContactUsViewController.swift
//  Lesson11HW
//

import UIKit

class ContactUsViewController: BaseViewController {
    @IBOutlet var textView: UITextView!
    @IBOutlet var submitButon: UIButton!
    @IBOutlet var placeholderLabel: UILabel!
    @IBOutlet var counterLabel: UILabel!
    
    private let maxCharactersCount = 320
    private let minCharactersCount = 15
}

// MARK: - UITextViewDelegate
extension ContactUsViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updateUI()
    }
   
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let textViewText = textView.text else { return false }
        let updatedText = (textViewText as NSString).replacingCharacters(in: range, with: text)
        
        return updatedText.count <= maxCharactersCount
    }
}

private extension ContactUsViewController {
    func updateUI() {
        updateCounterLabel()
        updateSubmitButton()
        updatePlaceholder()
    }
    
    func updateCounterLabel() {
       let remainCharactersCount = maxCharactersCount - textView.text.count
       counterLabel.text = "\(remainCharactersCount)"
        
       counterLabel.textColor = remainCharactersCount > 0 ? .systemGreen : .systemRed
    }
    
    func updateSubmitButton() {
        submitButon.isEnabled = textView.text.count >= minCharactersCount
    }
    
    func updatePlaceholder() {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}
