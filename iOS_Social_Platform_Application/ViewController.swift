//
//  ViewController.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 18/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var enterButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enterButton?.layer.borderWidth = CGFloat(1)
        self.enterButton?.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func enterButtonAction(_ sender: UIButton) {
        let targetVC = SocialPlatformViewController()
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
}

