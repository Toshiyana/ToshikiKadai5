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

    private enum Message {
        static let noDividend = "割られる数を入力してください"
        static let noDivisor = "割る数を入力してください"
        static let assignZeroToDivisor = "割る数には0を入力しないでください"
    }

    @IBAction private func divideButtonPressed(_ sender: UIButton) {
        guard let dividend = Double(dividendTextField.text ?? "") else {
            showAlert(message: Message.noDividend)
            return
        }

        guard let divisor = Double(divisorTextField.text ?? "") else {
            showAlert(message: Message.noDivisor)
            return
        }

        guard divisor != 0.0 else {
            showAlert(message: Message.assignZeroToDivisor)
            return
        }

        resultLabel.text = String(dividend / divisor)
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
