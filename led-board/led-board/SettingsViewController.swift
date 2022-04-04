//
//  SettingsViewController.swift
//  led-board
//
//  Created by 홍성범 on 2022/04/04.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    private func configureView() {
        if let ledText = ledText {
            textField.text = ledText
        }
        changeTextColor(color: textColor)
        changeBackgroundColor(color: backgroundColor)
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.orangeButton {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        } else {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        }
    }
    @IBAction func tapSaveButton(_ sender: UIButton) {
        delegate?.changedSetting(text: textField.text, textColor: textColor, backgroundColor: backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = (color == UIColor.yellow ? 1 : 0.2)
        self.purpleButton.alpha = (color == UIColor.purple ? 1 : 0.2)
        self.greenButton.alpha = (color == UIColor.green ? 1 : 0.2)
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = (color == UIColor.black ? 1 : 0.2)
        self.orangeButton.alpha = (color == UIColor.orange ? 1 : 0.2)
        self.blueButton.alpha = (color == UIColor.blue ? 1 : 0.2)
    }
}
