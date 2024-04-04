//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

import UIKit

class TermsPrivacyViewController: BaseViewController {
    @IBOutlet var agreeButton: UIButton!
}

// MARK: – UITextViewDelegate
extension TermsPrivacyViewController: UITextViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        if bottomEdge >= scrollView.contentSize.height {
            agreeButton.isEnabled = true
        }
    }
}
