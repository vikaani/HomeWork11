//
//  ProfileViewController.swift
//  Lesson11HW
//

import UIKit

class ProfileViewController: BaseViewController {
    @IBOutlet var firstNameTextFieldController: AppTextFieldController!
    @IBOutlet var lastNameTextFieldController: AppTextFieldController!
    
    private var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.isUserInteractionEnabled = editMode
    
        firstNameTextFieldController.setup()
        lastNameTextFieldController.setup()
        
        setupActions()
    }
}

// MARK: - Private
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
    }
    
    func updateViewState() {
        view.isUserInteractionEnabled = editMode
        
        if editMode {
            firstNameTextFieldController.setTextFieldAsFirstResponder()
        } else {
            view.endEditing(true)
        }
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"
        
        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        
        editMode.toggle()
        updateRigthtBarButton()
        updateViewState()
    }
}

