//
//  ViewController.swift
//  5
//
//  Created by Toshiyana on 2021/11/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var dividendTextField: UITextField!
    @IBOutlet private weak var divisorTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    enum DivideError {
        case noDividend
        case noDivisor
        case assignZeroToDivisor
    }

    @IBAction private func divideButtonPressed(_ sender: UIButton) {
        guard let dividend = Double(dividendTextField.text ?? "") else {
            showAlert(error: .noDividend)
            return
        }

        guard let divisor = Double(divisorTextField.text ?? "") else {
            showAlert(error: .noDivisor)
            return
        }
        if divisor == 0.0 {
            showAlert(error: .assignZeroToDivisor)
            return
        }

        resultLabel.text = String(dividend / divisor)
    }

    private func showAlert(error: DivideError) {
        let alertText: String

        switch error {
        case .noDividend:
            alertText = "割られる数を入力してください"
        case .noDivisor:
            alertText = "割る数を入力してください"
        case .assignZeroToDivisor:
            alertText = "割る数には0を入力しないでください"
        }

        let alert = UIAlertController(title: "課題5", message: alertText, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
