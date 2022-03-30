//
//  ViewController.swift
//  quotes-generator
//
//  Created by 홍성범 on 2022/03/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let quotes = [
        Quote(contents: "공정한 관찰자의 역할이 중요핟.", name: "Adam Smith"),
        Quote(contents: "Impossible is nothing.", name: "Adidas"),
        Quote(contents: "Just do it.", name: "Nike"),
        Quote(contents: "현재를 즐겨라, 가급적 내일이란 말은 최소한만 믿어라", name: "호라티우스")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapQuoteGeneratorButton(_ sender: UIButton) {
        let random = Int(arc4random_uniform(4)) // 0 ~ 3 random
        let quote = quotes[random]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = "- \(quote.name) -"
    }
    
}

