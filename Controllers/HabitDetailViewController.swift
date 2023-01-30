//
//  HabitDetailViewController.swift
//  GrowYourDragon
//
//  Created by Вадим Кузьмин on 30.01.2023.
//

import UIKit

final class HabitDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    // MARK: - Private variables
    private var scrollViewBottomConstraintConstant: CGFloat?
    private var keyboardIsActive: Bool = false

    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init?(coder: NSCoder, name: String) {
        super.init(coder: coder)
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayoutForKeyboard()
    }

    // MARK: - Actions
    @IBAction private func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - Keyboard Settings
extension HabitDetailViewController {
    private func prepareLayoutForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        scrollViewBottomConstraintConstant = scrollViewBottomConstraint.constant
    }
    // Keyboard
        @objc private func keyboardWillShow(notification: NSNotification) {
            guard !keyboardIsActive else {
                return
            }

            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                scrollViewBottomConstraint.constant += keyboardSize.height - (scrollViewBottomConstraintConstant ?? 0)
                keyboardIsActive = true
            }
        }

        @objc private func keyboardWillHide(notification: NSNotification) {
            guard keyboardIsActive else {
                return
            }

            scrollViewBottomConstraint.constant = scrollViewBottomConstraintConstant ?? 0
            keyboardIsActive = false
        }
}
