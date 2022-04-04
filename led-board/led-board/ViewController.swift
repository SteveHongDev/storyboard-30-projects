//
//  ViewController.swift
//  led-board
//
//  Created by 홍성범 on 2022/03/30.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = .yellow
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsViewController = segue.destination as? SettingsViewController {
            settingsViewController.delegate = self
            settingsViewController.ledText = contentsLabel.text
            settingsViewController.textColor = contentsLabel.textColor
            settingsViewController.backgroundColor = view.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            contentsLabel.text = text
        }
        contentsLabel.textColor = textColor
        view.backgroundColor = backgroundColor
        
    }
}

